{ config, inputs, pkgs, home-manager, ... }:

{
  home.file.".config/waybar/hyprland".text = ''
    [
      {
        "layer": "top",
        "position": "top",
        "height": 26,

        "modules-left": [
          "custom/close",
          "custom/search",
          "hyprland/workspaces"
        ],
        "modules-center": [ "clock" ],
        "modules-right": [
          "tray",
          "cpu",
          "memory",
          "temperature",
          "pulseaudio",
          "battery",
          "custom/power"
        ],

        "battery": {
          "states": {
            "full": 100,
            "nines": 99,
            "eights": 89,
            "sevens": 79,
            "sixes": 69,
            "fives": 59,
            "fours": 49,
            "threes": 39,
            "twos": 29,
            "ones": 19
          },
          "format-ones": "󰁺 {capacity}%",
          "format-twos": "󰁻 {capacity}%",
          "format-threes": "󰁼 {capacity}%",
          "format-fours": "󰁽 {capacity}%",
          "format-fives": "󰁾 {capacity}%",
          "format-sixes": "󰁿 {capacity}%",
          "format-sevens": "󰂀 {capacity}%",
          "format-eights": "󰂁 {capacity}%",
          "format-nines": "󰂂 {capacity}%",
          "format-full": "󰁹 {capacity}%",
          "on-click": "true"
        },

        "clock": {
          "format": "{:%a %b %d %I:%M %p}",
          "interval": 60,
          "max-length": 25,
          "on-click": "true"
        },

        "cpu": {
          "format": " {}%",
          "on-click": "true"
        },

        "memory": {
          "format": " {}%",
          "on-click": "true"
        },

        "pulseaudio": {
          "format": "{icon} {volume}%",
          "format-bluetooth": "{icon} {volume}%",
          "format-muted": "󰝟 Muted",
          "format-icons": {
            "headphone": "",
            "hands-free": "󰂑",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", ""]
          },
          "scroll-step": 1,
          "on-click": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        },

        "temperature": {
          "thermal-zone": 1,
          "critical-threshold": 60,
          "format": " {temperatureC}°C",
          "format-critical": " {temperatureC}°C",
          "on-click": "true"
        },

        "tray": {
          "icon-size": 24,
          "spacing": 10,
          "on-click": "true"
        },

        "hyprland/workspaces": {
          "all-outputs": true,
          "sort-by": "number",
          "on-click": "activate",
        },

        "custom/close": {
          "format": "{}",
          "exec": "${pkgs.hyprland-close}/bin/hyprland-close",
          "on-click": "hyprctl dispatch killactive",
          "tooltip": false
        },

        "custom/power": {
          "format": "  ",
          "on-click": "pkill nwgbar || nwgbar -c $HOME/.config/nwg-launchers/nwgbar/hyprland.css -t $HOME/.config/nwg-launchers/nwgbar/hyprland.json -o 0 -layer-shell-exclusive-zone -1",
          "tooltip": false
        },

        "custom/search": {
          "format": "   Applications",
          "on-click": "pkill nwggrid || nwggrid -c $HOME/.config/nwg-launchers/nwggrid/hyprland.css -o -0 -layer-shell-exclusive-zone -1",
          "tooltip": false
        }
      }
    ]
  '';
}
