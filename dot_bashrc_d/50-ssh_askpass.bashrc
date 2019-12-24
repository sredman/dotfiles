# Set SSH_ASKPASS variable

ASKPASS_PROGRAM=ksshaskpass

which "${ASKPASS_PROGRAM}" &>/dev/null
ASKPASS_INSTALLED=$?

if [ $ASKPASS_INSTALLED -eq 0 ]; then
  export SSH_ASKPASS="${ASKPASS_PROGRAM}"
fi

