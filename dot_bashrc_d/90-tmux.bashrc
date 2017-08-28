# Start tmux on every new shell
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach || tmux new-session;}
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux new-session; }
fi
