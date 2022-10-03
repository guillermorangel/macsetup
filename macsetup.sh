#!/bin/sh

# References:
# https://github.com/thoughtbot/laptop
# https://github.com/manlycode/dotfiles/blob/master/laptop_install.sh
# https://raw.githubusercontent.com/thoughtbot/laptop/master/mac

# Welcome to the edited thoughtbot laptop script!

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\\n" "$text" >> "$zshrc"
    else
      printf "\\n%s\\n" "$text" >> "$zshrc"
    fi
  fi
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.zshrc" ]; then
  touch "$HOME/.zshrc"
fi

# shellcheck disable=SC2016
append_to_zshrc 'export PATH="$HOME/.bin:$PATH"'

# Determine Homebrew prefix
arch="$(uname -m)"
if [ "$arch" = "arm64" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  fancy_echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

case "$SHELL" in
  */zsh)
    if [ "$(command -v zsh)" != '/usr/local/bin/zsh' ] ; then
      update_shell
    fi
    ;;
  *)
    update_shell
    ;;
esac

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
  fi
}

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    append_to_zshrc "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\""

    export PATH="$HOMEBREW_PREFIX/bin:$PATH"

    echo "eval \"\$($HOMEBREW_PREFIX/bin/brew shellenv)\"" >> $HOME/.zprofile
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi

if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi

fancy_echo "Updating Homebrew formulae ..."
brew update --force # https://github.com/Homebrew/brew/issues/1151
brew bundle --file=- <<EOF
tap "thoughtbot/formulae"
tap "homebrew/services"
tap "heroku/brew"

# Unix
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD"]
brew "git"
brew "openssl"
brew "rcm"
brew "reattach-to-user-namespace"
brew "the_silver_searcher"
brew "tmux"
brew "vim"
brew "watchman"
brew "zsh"

# Heroku
brew "heroku/brew/heroku"
brew "parity"

# GitHub
brew "gh"

# Image manipulation
brew "imagemagick"

# Programming language prerequisites and package managers
brew "libyaml" # should come after openssl
brew "coreutils"
brew "yarn"

# Databases
brew "postgresql@14", restart_service: :changed
brew "redis", restart_service: :changed

# Dev Utils
brew "ngrok"
EOF

fancy_echo "Update heroku binary ..."
brew unlink heroku
brew link --force heroku

fancy_echo "Configuring asdf version manager ..."
if [ ! -d "$HOME/.asdf" ]; then
  brew install asdf
  append_to_zshrc "source $(brew --prefix asdf)/asdf.sh" 1
fi

alias install_asdf_plugin=add_or_update_asdf_plugin
add_or_update_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  else
    asdf plugin-update "$name"
  fi
}

# shellcheck disable=SC1090
source "$(brew --prefix asdf)/asdf.sh"
add_or_update_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
add_or_update_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"

install_asdf_language() {
  local language="$1"
  local version
  version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

fancy_echo "Installing latest Ruby ..."
install_asdf_language "ruby"
gem update --system
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

fancy_echo "Installing latest Node ..."
install_asdf_language "nodejs"

if [ -f "$HOME/.laptop.local" ]; then
  fancy_echo "Running your customizations from ~/.laptop.local ..."
  # shellcheck disable=SC1090
  . "$HOME/.laptop.local"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Setup
# $ git clone guillermorangel/dotfiles

# Prerequisites:
# 1. Copy your ssh keys
# 2. Install Xcode

fancy_echo "Install additional packages via homebrew ..."
brew install wget
# brew tap knrz/iterm-workspace/iterm-workspace
# brew install iterm-workspace

# disable confirmation window about application being from the web
sudo spctl --master-disable

# TODO: split into font download and canon download
# TODO: move the canon section to bottom and make it an option to skip running canon downloads
# TODO: check for the existence of the fonts directory and delete before trying to download to avoid error
# fancy_echo "Run download.sh ..."
# source download.sh

# TODO: split vscode download and setup into it's own script
fancy_echo "Run casks.sh ..."
source casks.sh

fancy_echo "Run vs_code.sh ..."
source vs_code.sh

fancy_echo "Starting homebrew services ..."
# brew services start redis
brew services start postgresql@14

# TODO: Move these sections to the the top of the script
fancy_echo "Setup unique directories ..."
mkdir -p ~/git
mkdir -p ~/git/collectiveidea
mkdir -p ~/git/guillermorangel

# TODO: Add note about setting up iterm preferences and obsidian preferences before opening up apps
# TODO: Move setup notes to notion along with purchase keys for:
# TODO: TripMode, TablePlus, BetterDummy, etc
# TODO: Run system setup commands automatically

fancy_echo "Setup the following ..."
fancy_echo "
Remove apps from Dock:
$ defaults delete com.apple.dock persistent-apps; killall Dock

Make TextEdit open with a new document instead of a file window:
$ defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

Preferences:

General
- [ ] Allow wallpaper tinting in Windows

Dock & Menu Bar
- Decrease Dock size
- [x] Automatically hide and show the Dock
- [ ] Show recent applications applications
- Battery:
- - [x] Show Percentage
- Clock:
- - [x] Use a 24-hour clock
- Spotlight:
- - [ ] Disable Show in Menu Bar

Security & Privacy
- [x] Require password: {1 hour} after sleep or screen saver begins
- [x] Use your Apple Watch to unlock apps and your Mac
- Allow apps downloaded from: allow apps

Bluetooth
- Enable Show Bluetooth in menu bar

Sound
- [ ] Play sound on startup
- [x] Show volume in menu bar: {always}

Trackpad
- [x] Tap to click
- Tracking speed: 5th highest
- [x] App Exposé

Displays
- Set Resolution > Scaled > More Space
- Set Arrangement
- [ ] True Tone
- [ ] Automatically adjust brightness

Sharing
- Computer Name: guillermo's machine

Finder:

Menu > Finder > Preferences
- General
- - [x] Show these items on the desktop: External disks
- - New finder window shows: {guillermo}
- Sidebar
- - [ ] iCloud
- - [ ] Recent Tags
- Advanced
- - [x] Show all filename extensions

Menu > View > Show View Options
- Stack By: {Kind}
- Sort By: {Kind}
- Icon Size: 48
- Grid Spacing: 3rd highest
- Text size: {10}
- Label position: {Right}
- [x] Show item info

New Finder Window, Menu > View:
- Select: Show Path Bar
- Select: Show Status Bar
- > Show View Options
- - [x] Always open in column view
- - [x] Browse in column view

Safari Preferences
- General: 
- - Safari opens with: {A new private window}
- - [ ] Open safe files after downloading
- Advanced:
- - [ ] Show Develop menu in menu bar

When ready, Enter to setup applications via open.sh ..."

# TODO: Make it optional to start the macsetup process at differnt points
# TODO: Be able to choose to open or not
# TODO: make fancy echo and others globally available 
fancy_echo "Run open.sh ..."
source open.sh

# enable confirmation window about application being from the web
sudo spctl --master-enable

fancy_echo "All set. Cleaning up by deleting the macsetup directory: $ rm -rf <path/to/>macsetup"
echo $PWD
