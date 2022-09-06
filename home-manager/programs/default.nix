{ config, inputs, pkgs, ... }:

{
  imports = [
    ./exa
    ./feh
    ./fzf
    ./git
    ./neovim
    ./zoxide
    ./zsh
  ];
}
