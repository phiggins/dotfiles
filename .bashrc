# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ -r $HOME/.bashrc.local ] && source $HOME/.bashrc.local

platform=$(uname | tr '[:upper:]' '[:lower:]')
if [ -r "$HOME/.bashrc.$platform" ] ; then
  source "$HOME/.bashrc.$platform"
else
  echo "platform '$platform' not recognized from: $(uname -a)"
fi

# https://twitter.com/tpope/status/165631968996900865
PATH=".git/safe/../../bin:.git/safe/../../.bin:$PATH"

export EDITOR=vi
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
