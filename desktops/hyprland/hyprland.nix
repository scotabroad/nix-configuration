{ config, inputs, pkgs, ... }:

{
  imports = [ inputs.hyprland.nixosModules.default ];
    
  programs.hyprland = {
    enable = true;
    #package = null;
  };
}
