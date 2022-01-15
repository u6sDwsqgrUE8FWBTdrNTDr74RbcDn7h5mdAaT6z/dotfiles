# i3 config file (v4)

set $mod Mod4

font pango:monospace 8, FontAwesome 8

floating_modifier $mod

bindsym $mod+Return exec urxvt

bindsym $mod+Shift+q kill

bindsym $mod+d exec dmenu_run

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+g split toggle

bindsym $mod+f fullscreen toggle

bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+Shift+space floating toggle

bindsym $mod+space focus mode_toggle

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

bindsym $mod+n resize shrink width 5 px or 5 ppt
bindsym $mod+m resize grow width 5 px or 5 ppt
bindsym $mod+comma resize shrink height 5 px or 5 ppt
bindsym $mod+period resize grow height 5 px or 5 ppt

#bar {
#	font pango:monospace 8, FontAwesome 8
#	status_command i3blocks -c .config/i3/i3blocks.conf
#}
#bindsym $mod+b bar mode toggle
exec_always --no-startup-id ~/.config/polybar/launch

new_window 1pixel
hide_edge_borders smart

for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [title="Library"] floating enable
for_window [title="python3"] floating enable

exec_always urxvt -e sudo chkboot

bindsym $mod+s exec firejail --net=wlp3s0 --apparmor --seccomp --caps --caps.drop=all --nonewprivs --private-tmp --private-cache --private-dev --disable-mnt --netfilter --nodvd --notv --nou2f --nodbus firefox

bindsym $mod+v exec GTK_THEME=Adwaita:dark virt-manager
bindsym $mod+q exec urxvt -e python3 -q
bindsym $mod+c exec urxvt -e calcurse

bindsym --release $mod+z exec slock
bindsym $mod+x workspace 0; exec amixer -q -D pulse sset Master mute # && pkill -RTMIN+1 i3blocks
bindsym $mod+Control+Escape exec shutdown now

bindsym XF86AudioRaiseVolume exec amixer -q -D pulse sset Master 5%+ # && pkill -RTMIN+1 i3blocks 
bindsym XF86AudioLowerVolume exec amixer -q -D pulse sset Master 5%- # && pkill -RTMIN+1 i3blocks
bindsym XF86AudioMute exec amixer -q -D pulse sset Master toggle # && pkill -RTMIN+1 i3blocks
# fixes output stuck muted while Master is toggled
bindsym $mod+Control+t exec --no-startup-id amixer -D pulse sset Master toggle

bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 10
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc  10

#bindsym $mod+r gaps outer current plus 15
#bindsym $mod+t gaps inner current plus 15
#bindsym $mod+y gaps outer current minus 15
#bindsym $mod+u gaps inner current minus 15
#bindsym $mod+i gaps inner current toggle 0; gaps outer current toggle 0
#bindsym $mod+o gaps inner all toggle 0; gaps outer all toggle 0
