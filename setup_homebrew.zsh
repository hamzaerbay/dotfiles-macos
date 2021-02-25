#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install wget
# brew install httpie
# brew install bat
# brew install --cask rectangle

# # --no-quarantine disable the gatekeeper
# # Disable/enable quarantining of downloads (default: enabled).
# brew install --no-quarantine google-chrome
# brew install --no-quarantine firefox-developer-edition
# brew install --no-quarantine visual-studio-code

# use Brewfile instead of adding above commands
brew bundle --verbose