{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "272e33";
    bs-hl-color = "e67e80";
    key-hl-color = "a7c080";
    font = "Ubuntu";
    indicator-radius = 50;
    indicator-thickness = 10;
    line-uses-inside = true;
    separator-color = "272e3300";

    inside-color = "272e33";
    ring-color = "7fbbb3";
    text-color = "d3c6aa";

    text-caps-lock-color = "dbbc7f";

    inside-clear-color = "dbbc7f";
    ring-clear-color = "dbbc7f";
    text-clear-color = "272e33";

    inside-ver-color = "83c092";
    ring-ver-color = "83c092";
    text-ver-color = "272e33";

    inside-wrong-color = "e67e80";
    ring-wrong-color = "e67e80";
    text-wrong-color = "272e33";
  };
}
