{ config, inputs, pkgs, ... }:

{
  imports = [
    ./exa
    ./feh
    ./fzf
    ./git
    ./kitty
    ./neovim
    ./zoxide
    ./zsh
  ];
}
