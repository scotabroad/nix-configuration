{ config, inputs, pkgs, ... }:

{
  programs.firefox = {
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      firefox-color
    ];
  };
}
