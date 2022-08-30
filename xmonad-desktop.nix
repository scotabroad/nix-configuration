{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs/xmonad.nix
    ./services/xmonad.nix
  ];

  # Custom files
  home.file = {
    ".config/taffybar/nord.css".source = ./config/taffybar/nord.css;
    ".config/taffybar/taffybar.css".source = ./config/taffybar/taffybar.css;
  };

  xsession = {
    preferStatusNotifierItems = true; # For taffybar sni tray
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad/xmonad.hs;
    };
  };
}
