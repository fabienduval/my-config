# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi
fi


# make git submodules usable... auto pull them
# This overwrites the 'git' command with modifications where necessary, and
# calls the original otherwise
git() {
    if [[ $@ == clone* ]]; then
        gitargs=$(echo "$@" | cut -c6-)
        command git clone --recursive $gitargs
    elif [[ $@ == pull* ]]; then
        command git "$@" && command git submodule update --init --recursive
    elif [[ $@ == checkout* ]]; then
        command git "$@" && command git submodule update --init --recursive
    else
        command git "$@"
    fi
}


export ALTERNATE_EDITOR="emacs"
export EDITOR="ec"
export VISUAL="ec" # $VISUAL opens in GUI with non-daemon as alternate

export DOCKER_MOUNT_LOCAL=true
export DOCKER_NETWORK=host

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CURRENT_USER_ID=$(id -u):$(id -g)

# add root to display to launch app in dockers
xhost|grep root > /dev/null;
if [ $? -ne 0 ];
then
    xhost +SI:localuser:root
fi
