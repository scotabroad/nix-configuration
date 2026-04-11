{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage git
  programs.git = {
    enable = true;
    signing = {
      format = "openpgp";
    };
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
