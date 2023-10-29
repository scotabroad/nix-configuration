{ config, inputs, pkgs, ... }:

#exec-once = ${pkgs.xorg.xprop}/bin/xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2
{
  wayland.windowManager.hyprland.extraConfig = ''
########################################################################################
SHARED HYPR CONFIG.
ONLY PUT THINGS IN HERE TO BE SHARED BY ALL THEMES.
########################################################################################


monitor = , highres, auto, 2
exec-once = hyprpaper &
exec-once = ${pkgs.waybar}/bin/waybar --config $HOME/.config/waybar/hyprland --style $HOME/.config/waybar/hyprland.css &
exec-once = fcitx5 -r & nm-applet --indicator

input {
    kb_file = 
    kb_layout = us
    kb_variant = 
    kb_model = 
    kb_options = 
    kb_rules = 

    follow_mouse = 1

    touchpad {
        natural_scroll = true
        clickfinger_behavior = true
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    apply_sens_to_raw = false # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
    resize_on_border = true
}

decoration {
    rounding = 10
}

animations {
    enabled = true
    
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default, slide
    animation = specialWorkspace, 1, 6, default, fade
}

dwindle {
    pseudotile = true # enable pseudotiling on dwindle
    preserve_split = true
}

master {
    new_is_master = true
}

gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
    workspace_swipe_create_new = true
}

misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
}

binds {
    allow_workspace_cycles = false
}

xwayland {
    force_zero_scaling = true
}

#toolkit-specific scale
env = GDK_SCALE, 2

$mod1 = SUPER

# window rules
windowrule = fullscreen, ^(.*x86_64)$ #games should start fullscreen
# throw away sharing indicators
windowrulev2 = workspace special silent, title:^(Firefox — Sharing Indicator)$
windowrulev2 = workspace special silent, title:^(.*is sharing (your screen|a window)\.)$
# idle inhibit while watching videos
windowrulev2 = idleinhibit focus, class:^(mpv|.+exe)$
windowrulev2 = idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$
windowrulev2 = idleinhibit fullscreen, class:^(firefox)$
# all floating windows should center when first opened
windowrulev2 = center 1, floating:1

# some nice mousebinds
bindm = $mod1, mouse:272, movewindow #left click

# open apps
bind = CTRL_ALT, T, exec, kitty
bind = CTRL_SHIFT, escape, exec, gnome-system-monitor
bind = ALT, Print, exec, grim -g "$(slurp)" #screenshot tool
bind = , Print, exec, grim #screenshot tool
bind = $mod1, R, exec, pkill nwggrid || nwggrid -c $HOME/.config/nwg-launchers/nwggrid/hyprland.css -o 0 -layer-shell-exclusive-zone -1

# management
bind = CTRL, Q, killactive, 
bind = $mod1, Q, exec, pkill nwgbar || nwgbar -c $HOME/.config/nwg-launchers/nwgbar/hyprland.css -t $HOME/.config/nwg-launchers/nwgbar/hyprland.json -o 0 -layer-shell-exclusive-zone -1
bind = CTRL_ALT, Delete, exec, pkill nwgbar || nwgbar -c $HOME/.config/nwg-launchers/nwgbar/hyprland.css -t $HOME/.config/nwg-launchers/nwgbar/hyprland.json -o 0 -layer-shell-exclusive-zone -1
bind = $mod1, L, exec, swaylock -f

# passthrough mode (for VMs)
bind = $mod1, F11, submap, passthrough
submap = passthrough
bind = $mod1, F11, submap, reset
submap = reset

# audio
bind = , xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
bind = , xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
bind = , xf86audiomute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# brightness
bind = , xf86monbrightnessup, exec, light -A 10
bind = , xf86monbrightnessdown, exec, light -U 10

# switch window mode
bind = $mod1, V, togglefloating, 
bind = $mod1, J, togglesplit, #dwindle
bind = SHIFT_$mod1, V, workspaceopt, allfloat
bind = $mod1, P, pseudo, 
bind = SHIFT_$mod1, P, workspaceopt, allpseudo
bind = $mod1, F, fullscreen

# switch between apps
bind = $mod1, TAB, cyclenext, #none for next
bind = $mod1, TAB, bringactivetotop,
bind = SHIFT_$mod1, TAB, cyclenext, prev #will alternate between two windows
bind = SHIFT_$mod1, TAB, bringactivetotop,

# switch between workspaces
bind = $mod1, left, workspace, -1
bind = $mod1, right, workspace, +1
bind = $mod1, up, togglespecialworkspace
bind = $mod1, down, togglespecialworkspace
bind = $mod1, 1, workspace, 1
bind = $mod1, 2, workspace, 2
bind = $mod1, 3, workspace, 3
bind = $mod1, 4, workspace, 4
bind = $mod1, 5, workspace, 5
bind = $mod1, 6, workspace, 6
bind = $mod1, 7, workspace, 7
bind = $mod1, 8, workspace, 8
bind = $mod1, 9, workspace, 9

# move apps between workspaces
bind = $mod1_ALT, left, movetoworkspace, -1
bind = $mod1_ALT, right, movetoworkspace, +1
bind = $mod1_ALT, up, movetoworkspace, special
bind = $mod1_ALT, down, movetoworkspace, +0
bind = $mod1_ALT, 1, movetoworkspace, 1
bind = $mod1_ALT, 2, movetoworkspace, 2
bind = $mod1_ALT, 3, movetoworkspace, 3
bind = $mod1_ALT, 4, movetoworkspace, 4
bind = $mod1_ALT, 5, movetoworkspace, 5
bind = $mod1_ALT, 6, movetoworkspace, 6
bind = $mod1_ALT, 7, movetoworkspace, 7
bind = $mod1_ALT, 8, movetoworkspace, 8
bind = $mod1_ALT, 9, movetoworkspace, 9
'';
}
