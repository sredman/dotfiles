# Arcanist (phabricator.com) executable and tab completion
if [ -z ${ARCANIST_PATH+x} ]; then
  ARCANIST_PATH=~/src/arcanist/
  UNSET_ARCANIST_PATH=1
else
  UNSET_ARCANIST_PATH=0
fi

ARCANIST_BASH_COMPLETION=${ARCANIST_PATH}/resources/shell/bash-completion

if [ -e ${ARCANIST_PATH}bin/ ]; then
  PATH=${PATH}:${ARCANIST_PATH}bin/
fi

if [ -e ${ARCANIST_BASH_COMPLETION} ]; then
  source ${ARCANIST_BASH_COMPLETION}
fi

if [ ${UNSET_ARCANIST_PATH} -eq "1" ]; then
  unset ARCANIST_PATH
fi

unset ARCANIST_BASH_COMPLETION
unset UNSET_ARCANIST_PATH
