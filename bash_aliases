alias gti='git'

alias gitr='git rebase -i master'
alias gits='git status'
alias gitp='git pull'

# enable color support of ls
alias ls='ls --color=auto'

#alias grep='grep --color=auto -n'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias emacs='emacsclient.emacs25 -t -nw'

if [ -f ~/.bash_aliases.override ]; then
    . ~/.bash_aliases.override
fi
