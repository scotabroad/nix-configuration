{ pkgs, ... }:

final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "cfef78a5bc8df6a29e06ec128f7a6075425db402";
      sha256 = "XMpl1soXKFe1NOux4HRBrmMrANgcnjGeGsUUKOzOFkE=";
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
