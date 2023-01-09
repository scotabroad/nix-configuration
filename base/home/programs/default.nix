{ config, inputs, pkgs, ... }:

{
  imports = [
    ./exa
    ./firefox
    ./fzf
    ./git
    ./kitty
    ./neovim
    ./zoxide
    ./zsh
  ];
}
