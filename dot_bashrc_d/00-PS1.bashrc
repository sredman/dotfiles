# Make a sweet prompt
PS1="\n"
# Add the date in square brackets and the complete working path to PS1
PS1=${PS1}'\[\033[01;32m\][\D{%F %T}]\[\033[00m\] \[\033[01;34m\][\w]\[\033[00m\]'
PS1=${PS1}'\n'
# Add Guy's cool last-command success-code face
PS1=${PS1}"\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` "
# Colour hostname red if on an SSH connection
PS1_HOSTNAME='\[\033[01;31m\]\h\[\033[00m\]'
if [ -z "${SSH_CLIENT}" ]; then
  PS1_HOSTNAME='\h'
fi

# This is stolen from the conditionals (way) above. I am unconditionally taking the coloured prompt because it looks nicer
PS1=${PS1}'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@'${PS1_HOSTNAME}'\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \$ '
export PS1
