#!/bin/bash
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for utilities
brew install karabiner-elements #CASK
brew install clipy #CASK
brew install flux #CASK
brew install tmux

# for development
brew install visual-studio-code #CASK
brew install sequel-ace #CASK

# others
brew install google-chrome #CASK
brew install evernote #CASK
