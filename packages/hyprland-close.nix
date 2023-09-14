{ pkgs }:

final: prev: {
  hyprland-close = pkgs.writeScriptBin "hyprland-close" ''
    function handle {
      if [[ ''${1:0:17} == "activewindowv2>>," || ''${1:0:15} == "activewindow>>," || ''${1:0:11} == "closewindow" ]]; then
        echo
      else if [[ ''${1:0:12} == "activewindow" || ''${1:0:10} == "openwindow" ]]; then
             echo 󰅙
           fi
      fi
    }

    ${pkgs.socat}/bin/socat -u UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock - | while read line; do handle $line; done
  '';
}
