{ config, inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
########################################################################################
AUTOGENERATED HYPR CONFIG.
PLEASE USE THE CONFIG PROVIDED IN THE GIT REPO /examples/hypr.conf AND EDIT IT,
OR EDIT THIS ONE ACCORDING TO THE WIKI INSTRUCTIONS.
########################################################################################


#
# Please note not all available settings / options are set here.
# For a full list, see the wiki (basic and advanced configuring)
#

monitor=,preferred,auto,2

exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
exec-once=hyprpaper &
exec-once=waybar &

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
    main_mod=SUPER

    gaps_in=5
    gaps_out=10
    border_size=2

    apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

    damage_tracking=full # leave it on full unless you hate your GPU and want to make it suffer
}

decoration {
    rounding=5
    blur=1
    blur_size=3
    blur_passes=1
    blur_new_optimizations=1
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
}

misc {
    disable_hyprland_logo=1
    disable_splash_rendering=1
}

# example window rules
# for windows named/classed as abc and xyz
#windowrule=move 69 420,abc
#windowrule=size 420 69,abc
#windowrule=tile,xyz
#windowrule=float,abc
#windowrule=pseudo,abc
#windowrule=monitor 0,xyz

# some nice mouse binds
bindm=SUPER,mouse:272,movewindow #left click
bindm=SUPER,mouse:273,resizewindow #right click

# open apps
bind=CTRL_ALT,T,exec,kitty
bind=ALT,F,exec,firefox
bind=SUPER,F,exec,nautilus
bind=ALT,R,exec,rofi -show drun
bind=,Print,exec,grim #screenshot tool

# management
bind=CTRL,Q,killactive,
bind=SUPER,Q,exit,
bind=CTRL_ALT,P,exec,poweroff
bind=CTRL_ALT,R,exec,reboot

# audio
bind=,xf86audiolowervolume,exec,amixer -q set Master unmute 2%-
bind=,xf86audioraisevolume,exec,amixer -q set Master unmute 2%+
bind=,xf86audiomute,exec,amixer -q set Master toggle

# brightness
bind=,xf86monbrightnessup,exec,light -A 10
bind=,xf86monbrightnessdown,exec,light -U 10

# switch window mode
bind=SUPER,V,togglefloating,
bind=SUPER,P,pseudo,

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