{ config, inputs, pkgs, ... }:

{
  imports = [
    ./exa
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
