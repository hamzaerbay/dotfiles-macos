#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

if exists brew; then
  echo "Brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# brew install wget
# brew install httpie
# brew install bat
# brew install --cask rectangle

# # --no-quarantine disable the gatekeeper
# # Disable/enable quarantining of downloads (default: enabled).
# brew install --no-quarantine google-chrome
# brew install --no-quarantine firefox-developer-edition
# brew install --no-quarantine visual-studio-code

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# It's currently exported in zshrc
# export HOMEBREW_CASK_OPTS="--no-quarantine"
# https://github.com/Homebrew/homebrew-bundle/issues/474

# use Brewfile instead of adding above commands
brew bundle --verbose