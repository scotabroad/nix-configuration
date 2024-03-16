{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage vscode
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
  };    
}
