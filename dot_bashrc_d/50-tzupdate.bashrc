# Updates the timezone using geoip
# Requires installing tzupdate: pip install -U tzupdate
# Requires being able to run tzupdate at root, add a sudoers file

which tzupdate &>/dev/null
TZUPDATE_INSTALLED=$?

if [ $TZUPDATE_INSTALLED -eq 0 ]; then
  (sudo tzupdate &>/dev/null &)
fi
