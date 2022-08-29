{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage git
  programs.git = {
    enable = true;
    userName = "Liam Petrie";
    userEmail = "liamdpetrie@vivaldi.net";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };    
}
