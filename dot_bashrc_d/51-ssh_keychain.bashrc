# Only unlock the ssh key once. This particular solution doesn't seem to work
# very well with attaching and detaching screen/tmux
which keychain &> /dev/null

if [ $? -eq 0 ]; then
  eval $(keychain --eval id_rsa)
fi
