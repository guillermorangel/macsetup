#!/usr/bin/env bash

# VSCode Extensions

brew install --cask visual-studio-code

# General
code --install-extension christian-kohler.path-intellisense
code --install-extension eamodio.gitlens
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension pnp.polacode
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension sleistner.vscode-fileutils

# Ruby
code --install-extension bung87.rails
code --install-extension bung87.vscode-gemfile
code --install-extension castwide.solargraph
code --install-extension elliotlarson.ruby-around-the-block
code --install-extension misogi.ruby-rubocop
code --install-extension noku.rails-run-spec-vscode
code --install-extension rayhanw.erb-helpers
code --install-extension rebornix.ruby

# Vue
code --install-extension octref.vetur
code --install-extension jcbuisson.vue

# Formatting & Linting
code --install-extension abusaidm.html-snippets
code --install-extension anweber.vscode-tidyhtml
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension mrmlnc.vscode-scss
code --install-extension stylelint.vscode-stylelint
code --install-extension VisualStudioExptTeam.vscodeintellicode

# Themes
code --install-extension icao.electron-vue
code --install-extension github.github-vscode-theme

# Setup VSCode

echo "Open VSCode ..."
open /Applications/Visual\ Studio\ Code.app

echo "Set theme: Command+K Command+T > GitHub Dark Dimmed"
echo "Set settings:"

cat <<EOF
"editor.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
"editor.fontSize": 15,
"editor.fontWeight": "600",
"editor.tabSize": 2,
"files.insertFinalNewline": true,
"terminal.integrated.fontSize": 15,
"terminal.integrated.fontWeight": 600,
"terminal.integrated.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
"workbench.colorTheme": "GitHub Dark Dimmed"
EOF

echo "Enter, to continue"
read
