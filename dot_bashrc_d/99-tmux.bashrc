# Start tmux on every new shell
DEFAULT_SESSION='default'

is_child_process() {
  [[ -n "$TERM_PROGRAM" ]] && return 0
}

if command -v tmux>/dev/null; then
  # No-op inside VS Code/Copilot
  if is_child_process; then
    return 0 2>/dev/null || exit 0
  fi

  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux attach -t ${DEFAULT_SESSION} || tmux new -s ${DEFAULT_SESSION};}
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && { tmux new-session; }
fi
