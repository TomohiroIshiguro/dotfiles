#!/bin/bash
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for utilities
brew install google-japanese-ime
brew install warp
brew install tmux
brew install karabiner-elements --cask
brew install google-drive --cask
brew install clipy --cask

# for development
brew install git
brew install tfenv && \
  tfenv install latest && \
  tfenv use latest
brew install visual-studio-code --cask
brew install cursor --cask
brew install sequel-ace --cask
brew install docker --cask

# others
brew install google-chrome --cask
brew install brave-browser --cask
brew install 1password --cask
brew install slack --cask

brew list

echo "Done installing apps."
