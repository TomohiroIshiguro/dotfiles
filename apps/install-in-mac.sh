#!/bin/bash
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for utilities
brew install google-japanese-ime
brew install tmux
brew install karabiner-elements #CASK
brew install google-drive #CASK
brew install sublime-text #CASK
brew install xmind #CASK
brew install clipy #CASK
brew install flux #CASK

# for development
brew install git
brew install awscli
brew install tfenv && \
  tfenv install latest && \
  tfenv use latest
brew install visual-studio-code #CASK
brew install sequel-ace #CASK
brew install docker #CASK
brew install cyberduck #CASK

# others
brew install google-chrome #CASK
brew install brave-browser #CASK
brew install evernote #CASK
brew install biscuit #CASK
brew install kindle #CASK
brew install slack #CASK

brew list

echo "Done installing apps."
