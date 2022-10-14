{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage fzf
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };    
}
