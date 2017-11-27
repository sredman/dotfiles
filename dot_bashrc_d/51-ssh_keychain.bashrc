# Only unlock the ssh key once. This particular solution doesn't seem to work
# very well with attaching and detaching screen/tmux
which keychain &> /dev/null

if [ $? -eq 0 ]; then
  if [ -e ${HOME}/.ssh/id_rsa ]; then
    eval $(keychain --eval id_rsa)
  fi
  if [ -e ${HOME}/.ssh/id_ecdsa ]; then
    eval $(keychain --eval id_ecdsa)
  fi
fi
