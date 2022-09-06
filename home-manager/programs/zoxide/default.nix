{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage zoxide
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };    
}
