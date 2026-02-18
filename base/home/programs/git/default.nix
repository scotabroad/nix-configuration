{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage git
  programs.git = {
    enable = true;
    settings = {
      alias = {
        yolo = "!git commit -am \"$(curl -s whatthecommit.com/index.txt)\"";
      };
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };    
}
