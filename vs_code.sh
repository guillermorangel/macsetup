#!/usr/bin/env bash

# VSCode Extensions

brew install --cask visual-studio-code

# Display
code --install-extension aaron-bond.better-comments
code --install-extension pnp.polacode
code --install-extension robertz.code-snapshot
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension trybick.terminal-zoom

# Tools
code --install-extension chakrounanas.turbo-console-log
code --install-extension christian-kohler.path-intellisense
code --install-extension github.remotehub
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.live-server
# code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension sleistner.vscode-fileutils
code --install-extension visualstudioexptteam.intellicode-api-usage-examples
code --install-extension wallabyjs.quokka-vscode

# GoLang
code --install-extension golang.go

# Python
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance

# xml
code --install-extension dotjoshjohnson.xml

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
code --install-extension babobski.tatu-diff
code --install-extension christianalexander.flip
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension lmcarreiro.vscode-smart-column-indenter
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension mikestead.dotenv
code --install-extension mrmlnc.vscode-scss
code --install-extension phoihos.csv-to-md-table
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
{
  "auto-rename-tag.activationOnLanguage": [
    "*"
  ],

  "editor.cursorSmoothCaretAnimation": true,
  "editor.detectIndentation": false,
  "editor.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
  "editor.fontSize": 14,
  "editor.fontWeight": "600",
  "editor.formatOnSave": false,
  "editor.minimap.enabled": false,
  "editor.suggestSelection": "first",
  "editor.tabSize": 2,

  "gitlens.codeLens.enabled": false,
  "files.insertFinalNewline": true,
  "json.maxItemsComputed": 25000,
  "redhat.telemetry.enabled": true,

  "terminal.integrated.fontSize": 12,
  "terminal.integrated.fontWeight": 600,
  "terminal.integrated.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
  "workbench.colorTheme": "GitHub Dark Default",
  "workbench.tree.indent": 20,
  // "workbench.experimental.layoutControl.enabled": true,
  // "workbench.layoutControl.type": "toggles",
  "security.workspace.trust.untrustedFiles": "open",
  "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
  

  "[go]": {
    "editor.tabSize": 4
  },
  "go.goroot": "/Users/guillermo/.asdf/installs/golang/1.16/go",
  "go.toolsManagement.autoUpdate": true,

  // epic react
  "breadcrumbs.enabled": true,
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.fontLigatures": false,
  "editor.formatOnPaste": false,
  "editor.renderWhitespace": "none",
  "editor.rulers": [100],
  "editor.snippetSuggestions": "top",
  "editor.suggest.localityBonus": true,
  "editor.smoothScrolling": true,
  "editor.wordBasedSuggestions": false,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "explorer.confirmDragAndDrop": false,
  "files.defaultLanguage": "{activeEditorLanguage}",
  "files.exclude": {
    "USE_GITIGNORE": true
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.suggestSelection": "recentlyUsed",
    "editor.suggest.showKeywords": false
  },
  "javascript.validate.enable": false,
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "**/coverage": true,
    "**/dist": true,
    "**/build": true,
    "**/.build": true,
    "**/.gh-pages": true
  },
  // "eslint.packageManager": "yarn",
  // "eslint.validate": [
  //   "scss",
  //   "html",
  //   "javascript",
  //   "javascriptreact",
  //   "typescript",
  //   "typescriptreact",
  //   "vue"
  // ],
  // "eslint.options": {
  //   "env": {
  //     "browser": true,
  //     "jest/globals": true,
  //     "es6": true
  //   },
  //   // "overrideConfig": {
  //     "parserOptions": {
  //       "ecmaVersion": 2019,
  //       "sourceType": "module",
  //       "ecmaFeatures": {
  //         "jsx": true
  //       }
  //     },
  //     "rules": {
  //       "no-debugger": "off"
  //     }
  //   // },

  // },
  "grunt.autoDetect": "off",
  "gulp.autoDetect": "off",
  "npm.runSilent": true,
  "php.suggest.basic": false,
  "git.confirmSync": false,
  "tatu-diff.getting_started": false,

  // turbo console log
  "turboConsoleLog.insertEnclosingClass": false,
  "turboConsoleLog.insertEnclosingFunction": false,
  "turboConsoleLog.includeFileNameAndLineNum": false,
  "cSpell.enabled": false,
  "search.useIgnoreFiles": true,
  "search.useGlobalIgnoreFiles": true,

  // emmet
  "emmet.includeLanguages": {
    "erb-html": "html",
    "ruby-html": "html"
  },
  "zenMode.fullScreen": false,
  "zenMode.hideLineNumbers": false,
  "zenMode.hideTabs": false,
}

EOF

echo "Enter, to continue"
read
