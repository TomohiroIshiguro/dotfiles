#!/bin/bash
set -euo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# for utilities
brew install karabiner-elements #CASK
brew install oogle-drive-file-stream #CASK
brew install sublime-text #CASK
brew install xmind #CASK
brew install clipy #CASK
brew install flux #CASK
brew install tmux

# for development
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