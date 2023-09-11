{ config, inputs, pkgs, ... }:

{
  imports = [
    ./eza
    ./firefox
    ./fzf
    ./git
    ./kitty
    ./neovim
    ./obs-studio
    ./zoxide
    ./zsh
  ];
}
