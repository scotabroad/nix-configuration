{ config, inputs, pkgs, ... }:

{
  imports = [
    ./emacs
    ./exa
    ./feh
    ./git
    ./neovim
    ./zsh
  ];
}
