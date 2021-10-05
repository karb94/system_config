# Start compositor
command -v picom >/dev/null 2>&1 && picom -CG &

# xsetroot -cursor_name left_ptr solves problem with "cross" cursor
command -v xsetroot >/dev/null 2>&1 && xsetroot -cursor_name left_ptr &

# # set background
command -v hsetroot >/dev/null 2>&1 && hsetroot -solid "#000000" &

# # Hide cursor after 1 second of inactivity
command -v unclutter >/dev/null 2>&1 && unclutter --timeout 1 --ignore-scrolling &

# # Notifications daemon
dunst &

# tmux
# [ -f $HOME/.local/scripts/tmux_init ] &&
#     $HOME/.local/scripts/tmux_init &

# Volume bar
command -v xob >/dev/null 2>&1 && [ -p "$HOME"/.local/bin/xob_volume_fifo ] &&
  ( tail -f "$HOME"/.local/bin/xob_volume_fifo |
  xob -s volume >/dev/null 2>&1 & )

# Hot-key daemon
sxhkd -m -1 &

# Keyboard layout
test -f $HOME/.local/share/X11/xkb/qwerty.xkb &&
  xkbcomp $HOME/.local/share/X11/xkb/qwerty.xkb $DISPLAY &

# Window manager
exec bspwm
