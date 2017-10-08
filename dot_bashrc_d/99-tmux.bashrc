# Start tmux on every new shell
DEFAULT_SESSION='default'
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach -t ${DEFAULT_SESSION} || tmux new -s ${DEFAULT_SESSION};}
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux new-session; }
fi
