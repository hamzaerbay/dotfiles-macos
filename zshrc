# -------------------------
# ZSH Configuration
# -------------------------

# Uncomment to profile zsh startup time
# zmodload zsh/zprof

# ZSH options
setopt nocaseglob

# -------------------------
# Environment Variables
# -------------------------

# Path configuration
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Tools and utilities
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"

# -------------------------
# Plugin Management
# -------------------------

# Starship prompt
eval "$(starship init zsh)"

# -------------------------
# NVM (Node Version Manager) - Lazy Loading
# -------------------------
export NVM_DIR="$HOME/.nvm"

load_nvm() {
    if [[ ! -f $NVM_DIR/nvm.sh ]]; then
        return 1
    fi

    source "$HOME/.nvm/nvm.sh"
    source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

    # Remove the stub function
    unfunction load_nvm

    # Check if the alias exists before trying to remove it
    (( $+aliases[nvm] )) && unalias nvm
}

nvm() {
    load_nvm && nvm "$@"
}

# -------------------------
# PNPM Configuration
# -------------------------
export PNPM_HOME="/Users/hamzaerbay/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -------------------------
# Aliases
# -------------------------

# General aliases
alias pn=pnpm
alias ls='eza -lAh --git'
alias npkill='npx npkill'

# Docker + Django aliases
alias docker-superuser="docker-compose run app sh -c 'python manage.py createsuperuser'"
alias docker-makemig="docker-compose run app sh -c 'python manage.py makemigrations'"
alias docker-mig="docker-compose run app sh -c 'python manage.py migrate'"
alias docker-black="docker-compose run app sh -c 'black .'"
alias docker-dump="docker-compose run app sh -c 'python manage.py dumpdata > db.json'"

# Docker + Next.js aliases
alias docker-next-build="docker build . -t my-next-js-app"
alias docker-next-run="docker run -p 3000:3000 my-next-js-app"

# GitHub CLI aliases
alias ghr='gh repo'
alias ghpr='gh pr'
alias ghi='gh issue'
alias ghrc='gh repo create'
alias ghprv='gh pr view'
alias ghprc='gh pr create'
alias ghprco='gh pr checkout'
alias ghprl='gh pr list'
alias ghil='gh issue list'
alias ghic='gh issue create'
alias ghiv='gh issue view'
alias ghs='gh status'
alias ghd='gh dash'
alias gra='gh repo view --web'

# -------------------------
# Functions
# -------------------------

# Django app creation in Docker
docker-django-create-app() {
	docker-compose run app sh -c "python manage.py startapp $1"
}

# Create directory and cd into it
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# Convert text to binary
function get-binary() {
	echo -n "$@" | xxd -b
}

# -------------------------
# Commented Out / Unused 
# -------------------------

# Alternative NVM loading (not using lazy loading)
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Alternative aliases
# alias eza='eza -lah --git'
# alias kill-nm='find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +'

# Custom prompt (replaced by Starship)
# PROMPT="%(?:%{$fg_bold[green]%}⚡️:%{$fg_bold[red]%}⚡️)"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# SSH agent setup
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#   eval `ssh-agent -s`
#   ssh-add
# fi

# Uncomment to show zsh profiling results at the end
# zprof
