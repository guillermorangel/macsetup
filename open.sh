#!/usr/bin/env bash

echo ""
open /Applications/Google\ Chrome.app
echo "Download and install Roboto Mono Font: https://fonts.google.com/specimen/Roboto+Mono"
echo "Enter, to continue"
read

echo "VSCode"
open /Applications/Visual\ Studio\ Code.app
cat <<EOF
Set theme:
Command+K Command+T > GitHub Dark Dimmed

Settings:
"editor.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace",
"editor.fontSize": 15,
"editor.fontWeight": "600",
"files.insertFinalNewline": true,
"terminal.integrated.fontSize": 15,
"terminal.integrated.fontWeight": 600,
"terminal.integrated.fontFamily": "Roboto Mono, Menlo, Monaco, 'Courier New', monospace"

EOF

echo "Enter, to continue"
read

echo "Dropbox"
open /Applications/Dropbox.app
echo "Enter, to continue"
read

echo "Obsidian"
echo "Set valut to: ~/Dropbox/Documents/Obsidian/Vault"
open /Applications/Obsidian.app

echo "iTerm"
open /Applications/iTerm.app

echo "Flux"
open /Applications/Flux.app

echo "Lunar"
open /Applications/Lunar.app

echo "Rectangle"
open /Applications/Rectangle.app

echo "GitKraken"
open /Applications/GitKraken.app

echo "Figma"
open /Applications/Figma.app

echo "TablePlus"
open /Applications/TablePlus.app

echo "Slack"
open /Applications/Slack.app

echo "Bitwarden"
open /Applications/Bitwarden.app

echo "Keybase"
open /Applications/Keybase.app

echo "Megasync"
open /Applications/Megasync.app

echo "Notion"
open /Applications/Notion.app

echo "Spotify"
open /Applications/Spotify.app

echo "TradingView"
open /Applications/TradingView.app
