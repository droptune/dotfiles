#!/usr/bin/env bash
# based on dracula theme
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{
  time_format="%H:%M"

  white='#f8f8f2'
  gray='#44475a'
  dark_gray='#282a36'
  light_purple='#bd93f9'
  dark_purple='#6272a4'
  green='#50fa7b'
  orange='#ffb86c'
  red='#ff5555'
  pink='#ff79c6'
  dark_teal='#00b37d'
  cyan='#00a8e8'

  left_icon='🦆 '

  tmux set-option -g status-interval 5
  tmux set-option -g clock-mode-style 24
  # set length
  #
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100

  # pane border styling
  tmux set-option -g pane-active-border-style "fg=${dark_purple}"
  tmux set-option -g pane-border-style "fg=${gray}"

  # message styling
  tmux set-option -g message-style "bg=${gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${gray},fg=${white}"

  # Status left
  tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}] ${left_icon}"

  tmux set-option -g status-right ""

  # Battery
  tmux set-option -ga status-right "#[bg=${pink},fg=${dark_gray}]#($current_dir/battery.sh) "

  # Network
  SSID=$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p')
  tmux set-option -ga status-right "#[bg=${cyan},fg=${dark_gray}] $SSID "

  # VPN
  tmux set-option -ga status-right "#[bg=${cyan},fg=${dark_gray}] #(pgrep openvpn $$ echo ' 📡VPN ')"

  # Kubernetes context
  k8s_context=$(kubectl config view --minify --output 'jsonpath={.current-context}')
  tmux set-option -ga status-right "#[bg=${orange},fg=${dark_gray}] $k8s_context "

  # TIme
  tmux set-option -ga status-right "#[bg=${dark_teal},fg=${dark_gray}] ${time_format} "

  tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #W#{?window_bell_flag,🔔,}#{?window_zoomed_flag, 🔍,} "
  tmux set-window-option -g window-status-format "#[fg=${white}]#[bg=${gray}] #I #W"
  tmux set-window-option -g window-status-activity-style "bold"
  tmux set-window-option -g window-status-bell-style "bold"
}

main
