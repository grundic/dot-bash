# 2011-10-19: tmux shortcut for creating/attaching named sessions
  tm() {
    [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
    tmux has -t $1 && tmux attach -d -t $1 || tmux new -s $1
  }

# 2011-10-19
# stolen from completion function _tmux
  function __tmux-sessions() {
      local expl
      local -a sessions
      sessions=( ${${(f)"$(command tmux list-sessions)"}/:[ $'\t']##/:} )
      _describe -t sessions 'sessions' sessions "$@"
  }
  #compdef __tmux-sessions tm
  complete __tmux-sessions tm
