{ pkgs }:

final: prev: {
  wayland-gtk-fix = pkgs.writeShellScript "wayland-gtk-fix" ''
    # make portals launch after hyprland exec-once modules
    sleep 4
    systemctl --user stop xdg-desktop-portal-wlr.service
    systemctl --user stop xdg-desktop-portal.service
    systemctl --user start xdg-desktop-portal-wlr.service
    sleep 4
    systemctl --user start xdg-desktop-portal.service
  '';
}
