# Add ~/bin to the path, if it exists
# This should be late in the decomposed-source-file ordering to make sure it
#  takes precidence

if [ -e ~/bin ]; then
  PATH=~/bin:${PATH} #Newer version, other overrides
fi
