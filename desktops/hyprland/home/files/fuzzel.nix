{ config, inputs, pkgs, ... }:

{
  home.file = {
    # Empty file to prevent fuzzel from saving history
    ".cache/fuzzel".text = ''
    '';
  };
}
