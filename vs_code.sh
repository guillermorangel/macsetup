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
{
  "auto-rename-tag.activationOnLanguage": ["*"],
  "editor.cursorSmoothCaretAnimation": true,
  "editor.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
  "editor.fontSize": 15,
  "editor.fontWeight": "600",
  "editor.formatOnSave": false,
  "editor.tabSize": 2,
  "gitlens.codeLens.enabled": false,
  "files.insertFinalNewline": true,
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.fontWeight": 600,
  "terminal.integrated.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
  "workbench.colorTheme": "GitHub Dark Dimmed",
  "workbench.tree.indent": 20,
  "security.workspace.trust.untrustedFiles": "open",
  "editor.suggestSelection": "first",
  "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",

  // epic react
  "breadcrumbs.enabled": true,
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.defaultFormatter": "anweber.vscode-tidyhtml",
  "editor.detectIndentation": true,
  "editor.fontLigatures": false,
  "editor.formatOnPaste": false,
  "editor.renderWhitespace": "trailing",
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
    "editor.defaultFormatter": "anweber.vscode-tidyhtml",
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
  "eslint.packageManager": "yarn",
  "eslint.validate": [
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue"
  ],
  "eslint.options": {
    "env": {
      "browser": true,
      "jest/globals": true,
      "es6": true
    },
    "parserOptions": {
      "ecmaVersion": 2019,
      "sourceType": "module",
      "ecmaFeatures": {
        "jsx": true
      }
    },
    "rules": {
      "no-debugger": "off"
    }
  },
  "grunt.autoDetect": "off",
  "gulp.autoDetect": "off",
  "npm.runSilent": true,
  "php.suggest.basic": false,
  "editor.minimap.enabled": false,
}
EOF

echo "Enter, to continue"
read
