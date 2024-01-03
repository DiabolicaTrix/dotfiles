show_kube-tmux() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_kube-tmux_icon" "󱃾")"
  local color="$(get_tmux_option "@catppuccin_kube-tmux_color" "$thm_blue")"

  local text="$(kubectl config current-context | cut -d '@' -f2)"
  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
