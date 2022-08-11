{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage exa
  programs.exa = {
    enable = true;
    enableAliases = false; # interferes with a zsh plugin, zpm-zsh/ls
  };
}
