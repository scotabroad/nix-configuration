{ pkgs, ... }:

final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [
      "-Dexperimental=true"
    ];

    #This patch is for hyprland only
    patches = (oldAttrs.patches or []) ++ [
      ./waybar.patch
    ];
  });
}
