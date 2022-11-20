alias gti='git'

alias gitr='git rebase -i master'
alias gits='git status'

# enable color support of ls
alias ls='ls --color=auto'
# ll - ls with everything
alias ll='ls -alF'

if [ -f ~/.bash_aliases.override ]; then
    . ~/.bash_aliases.override
fi
