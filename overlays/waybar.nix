{ pkgs, ... }:

final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "5e2895ccb3542e3402855c81b183a67790608ff5";
      sha256 = "rb1TQk8mQyLUOxBxTb6zsTUW7uEvmvGYvVXTH/x19iw=";
    };

    mesonFlags = oldAttrs.mesonFlags ++ [
      "-Dexperimental=true"
    ];

    #This patch is for hyprland only
    patches = (oldAttrs.patches or []) ++ [
      ./waybar.patch
    ];
  });
}
