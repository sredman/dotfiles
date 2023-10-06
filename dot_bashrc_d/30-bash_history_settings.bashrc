# Configuration options for bash's history go here

# Add a timestamp to bash's history command
export HISTTIMEFORMAT="%d/%m/%y %T "

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
