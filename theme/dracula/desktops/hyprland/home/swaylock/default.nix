{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "282a36";
    bs-hl-color = "ff5555";
    key-hl-color = "50fa7b";
    font = "Ubuntu";
    indicator-radius = 50;
    indicator-thickness = 10;
    line-uses-inside = true;
    separator-color = "282a3600";
    
    inside-color = "282a36";
    ring-color = "6272a4";
    text-color = "f8f8f2";

    text-caps-lock-color = "f1fa8c";

    inside-clear-color = "f1fa8c";
    ring-clear-color = "f1fa8c";
    text-clear-color = "282a36";

    inside-ver-color = "6272a4";
    ring-ver-color = "6272a4";
    text-ver-color = "282a36";

    inside-wrong-color = "ff5555";
    ring-wrong-color = "ff5555";
    text-wrong-color = "282a36";
  };
}
