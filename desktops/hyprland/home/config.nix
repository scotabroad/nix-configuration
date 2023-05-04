{ config, inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
########################################################################################
SHARED HYPR CONFIG.
ONLY PUT THINGS IN HERE TO BE SHARED BY ALL THEMES.
########################################################################################


monitor=,preferred,auto,2
exec-once=${pkgs.dbus}/bin/dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once=${pkgs.xorg.xprop}/bin/xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
exec-once=${pkgs.hyprland-active}/bin/hyprland-active
exec-once=hyprpaper &
exec-once=waybar &
exec-once=fcitx5 -r &
exec-once=nm-applet --indicator &

input {
    kb_file=
    kb_layout=
    kb_variant=
    kb_model=
    kb_options=
    kb_rules=

    follow_mouse=1

    touchpad {
        natural_scroll=yes
        clickfinger_behavior=yes
    }

    sensitivity=0 # -1.0 - 1.0, 0 means no modification.
}

general {
    gaps_in=5
    gaps_out=10
    border_size=2

    apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
}

decoration {
    rounding=10
}

animations {
    enabled=1
    animation=windows,1,7,default
    animation=border,1,10,default
    animation=fade,1,10,default
    animation=workspaces,1,6,default
}

dwindle {
    pseudotile=0 # enable pseudotiling on dwindle
}

gestures {
    workspace_swipe=yes
    workspace_swipe_fingers = 3
    workspace_swipe_create_new = true
}

misc {
    disable_hyprland_logo=1
    disable_splash_rendering=1
}

binds {
    allow_workspace_cycles = false
}

# window rules
windowrule=fullscreen,^(.*x86_64)$ #games should start fullscreen

#some nice mousebinds
bindm=SUPER,mouse:272,movewindow #left click

# enter resize submap
bind=SUPER,R,submap,resize
submap=resize
bindm=,mouse:272,resizewindow
bindm=SUPER,mouse:272,movewindow #left click
#exit to main submap
bind=,escape,submap,reset
submap=reset

# enter move submap
bind=SUPER,M,submap,move
submap=move
bindm=,mouse:272,movewindow
#exit to main submap
bind=,escape,submap,reset
submap=reset

# open apps
bind=CTRL_ALT,T,exec,env XCURSOR_SIZE=24 kitty
bind=ALT,F,exec,firefox
bind=SUPER,F,exec,nautilus
bind=ALT,Print,exec,grim -g "$(slurp)" #screenshot tool
bind=,Print,exec,grim #screenshot tool
bind=ALT,R,exec,pkill nwggrid || nwggrid -o 0 -layer-shell-exclusive-zone -1

# management
bind=CTRL,Q,killactive,
bind=SUPER,Q,exec,pkill nwgbar || nwgbar -o 0 -layer-shell-exclusive-zone -1
bind=SUPER,L,exec,swaylock -f
bind=CTRL_ALT,P,exec,pkill nwgbar || nwgbar -o 0 -layer-shell-exclusive-zone -1
bind=CTRL_ALT,R,exec,pkill nwgbar || nwgbar -o 0 -layer-shell-exclusive-zone -1

# audio
bind=,xf86audiolowervolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
bind=,xf86audioraisevolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
bind=,xf86audiomute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# brightness
bind=,xf86monbrightnessup,exec,light -A 10
bind=,xf86monbrightnessdown,exec,light -U 10

# switch window mode
bind=SUPER,V,togglefloating,
bind=SHIFT_SUPER,V,workspaceopt,allfloat
bind=SUPER,P,pseudo,
bind=SHIFT_SUPER,P,workspaceopt,allpseudo
bind=CTRL_ALT,F,fullscreen

# switch between apps
bind=SUPER,TAB,movefocus,r
bind=SHIFT_SUPER,TAB,movefocus,l

# switch between workspaces
bind=SUPER,left,workspace,-1
bind=SUPER,right,workspace,+1

# move apps between workspaces
bind=SUPER_ALT,left,movetoworkspace,-1
bind=SUPER_ALT,right,movetoworkspace,+1
'';
}
