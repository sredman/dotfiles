# Optional host-dependant settings
if [ -e ${HOME}/.bashrc-${HOSTNAME} ]; then
  source ${HOME}/.bashrc-${HOSTNAME}
fi
