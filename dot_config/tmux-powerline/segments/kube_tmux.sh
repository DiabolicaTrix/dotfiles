# Prints the kube context.

TMUX_POWERLINE_SEG_HOSTNAME_FORMAT_DEFAULT="short"

run_segment() {
  /bin/zsh $HOME/.tmux/kube-tmux/kube.tmux 250 red cyan
	return 0
}
