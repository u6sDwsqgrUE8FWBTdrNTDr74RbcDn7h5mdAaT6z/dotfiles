[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec xautolock -secure -time 5 -locker slock &
exec dwmblocks &
exec dwm
