alias emacs='emacs -nw'
alias gti='git'

# enable color support of ls
alias ls='ls --color=auto'

#alias grep='grep --color=auto -n'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias emacs='emacsclient -t'

alias csshb="cssh \$(ls /home/fduval/git/infra/puppet/hiera_data/fqdn/ | sed 's/.yaml//g' | grep -E '^b[0-9]+')"
alias csshq="cssh \$(ls /home/fduval/git/infra/puppet/hiera_data/fqdn/ | sed 's/.yaml//g' | grep -E '^q[0-9]+')"
alias csshr="cssh \$(ls /home/fduval/git/infra/puppet/hiera_data/fqdn/ | sed 's/.yaml//g' | grep -E '^r[0-9]+')"
alias csshp="cssh \$(ls /home/fduval/git/infra/puppet/hiera_data/fqdn/ | sed 's/.yaml//g' | grep -E '^p[0-9]+')"
alias csshf="cssh \$(ls /home/fduval/git/infra/puppet/hiera_data/fqdn/ | sed 's/.yaml//g' | grep -E '^f[0-9]+')"
