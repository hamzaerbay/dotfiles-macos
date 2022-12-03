## Hamza's dotfiles
I wanted to be able to execute a single command to "install" a new system to pull down all of my dotfiles and configs, as well as install all the tools I commonly use. In addition, I wanted to be able to re-execute that command at any time to synchronize anything that might have changed. Finally, I wanted to make it easy to re-integrate changes back in, so that other machines could be updated.


## Install
Pull the repo under the `~/.dotfiles` 
```
./install
```
## Apps/Packages
Check out the `Brewfile`

## Update Brewfile
Update `Brewfile` after install new app via homebrew
```
brew bundle dump --force --describe
```