{ config, inputs, pkgs, ... }:

{
  imports = [
    ./eza
    ./firefox
    ./fzf
    ./git
    ./lilypond
    ./neovim
    ./obs-studio
    #./vscode
    ./zoxide
    ./zsh
  ];
}
