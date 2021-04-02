export ZSH="/Users/hamzaerbay/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(git)

source $ZSH/oh-my-zsh.sh
# Set Variables
# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Create Aliases

alias ls='ls -lAFh'
alias exa='exa -laFh --git'
# alias kill-nm='find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +'
alias npkill='npx npkill'
# Django aliases
alias docker-superuser="docker-compose run app sh -c 'python manage.py createsuperuser'"
alias docker-makemig="docker-compose run app sh -c 'python manage.py makemigrations'"
alias docker-mig="docker-compose run app sh -c 'python manage.py migrate'"
alias docker-black="docker-compose run app sh -c 'black .'"
alias docker-dump="docker-compose run app sh -c 'python manage.py dumpdata > db.json'"
docker-django-create-app() {
	docker-compose run app sh -c "python manage.py startapp $1"
}

# Customize Prompt(s)

PROMPT="%(?:%{$fg_bold[green]%}⚡️:%{$fg_bold[red]%}⚡️)"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Write Handy Functions

function mkcd() {
  mkdir -p "$@" && cd "$_"
}
# Use ZSH Plugins


# and Others
