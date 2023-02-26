#!/bin/bash
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for utilities
brew install google-japanese-ime
brew install tmux
brew install karabiner-elements --cask
brew install google-drive --cask
brew install sublime-text --cask
brew install xmind --cask
brew install clipy --cask
brew install flux --cask

# for development
brew install git
brew install awscli
brew install tfenv && \
  tfenv install latest && \
  tfenv use latest
brew install visual-studio-code --cask
brew install sequel-ace --cask
brew install docker --cask
brew install cyberduck --cask

# others
brew install google-chrome --cask
brew install brave-browser --cask
brew install evernote --cask
brew install biscuit --cask
brew install kindle --cask
brew install slack --cask

brew list

echo "Done installing apps."
