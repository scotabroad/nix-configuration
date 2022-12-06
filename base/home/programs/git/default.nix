{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage git
  programs.git = {
    enable = true;
    aliases = {
      yolo = "!git commit -am \"$(curl -s whatthecommit.com/index.txt)\"";
    };
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
