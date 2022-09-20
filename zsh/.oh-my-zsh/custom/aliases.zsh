# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
# You can add a file named "projects.zsh" with the following content:
# alias projects="cd ~/projects"
# and it will be loaded automatically.
alias projects="cd ~/dev"
alias dotfiles="cd ~/.dotfiles"
alias editzshrc="vim ~/.zshrc"
alias editaliases="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias editvimrc="vim ~/.vimrc"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert="notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \"$(history|tail -n1|sed -e 's/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//' )\""

# Aliases
alias zshconfig="vim ~/.zshrc"

# Git
alias g="git"

# Docker
alias d="docker"
alias dc="docker-compose"
