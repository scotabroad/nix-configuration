{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage eza, replacement for the now unmaintained exa
  programs.eza = {
    enable = true;
    enableAliases = false; # interferes with a zsh plugin, zpm-zsh/ls
  };
}
