export ZSH="/Users/hamzaerbay/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(git)

source $ZSH/oh-my-zsh.sh

# Create Aliases

alias ls='ls -lAFh'
alias docker-superuser="docker-compose run app sh -c 'python manage.py createsuperuser'"
alias docker-makemig="docker-compose run app sh -c 'python manage.py makemigrations'"
alias docker-mig="docker-compose run app sh -c 'python manage.py migrate'"
docker-django-create-app() {
	docker-compose run app sh -c "python manage.py startapp $1"
}

# Customize Prompt(s)

PROMPT="%(?:%{$fg_bold[green]%}⚡️:%{$fg_bold[red]%}⚡️)"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Add Locations to $PATH Variable

# Write Handy Functions

function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# Use ZSH Plugins


# and Others
