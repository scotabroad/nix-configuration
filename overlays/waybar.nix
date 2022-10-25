{ pkgs, ... }:

final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "1374b0fce40f283b113e051f0558564fa1d9ad22";
      sha256 = "UG233AXx7xU9O3/hs5mIXun7PCYibJvlDL1tQhB5gxE=";
    };
    mesonFlags = oldAttrs.mesonFlags ++ [
      "-Dexperimental=true"
      "-Djack=disabled"
      "-Dlibinput=disabled"
    ];
    
    checkInputs = [ pkgs.catch2_3 ];

    #This patch is for hyprland only
    patches = (oldAttrs.patches or []) ++ [
      ./waybar.patch
    ];
  });
}
