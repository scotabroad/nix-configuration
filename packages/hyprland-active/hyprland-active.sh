#! /run/current-system/sw/bin/bash

function handle {
  if [[ ${1:0:14} == "activewindowv2" ||  ${1:0:12} == "activewindow" ]]; then
    hyprctl dispatch bringactivetotop
  fi
}

#Need to see if socat can be enabled via Nix here...
socat -u UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock - | while read line; do handle $line; done
