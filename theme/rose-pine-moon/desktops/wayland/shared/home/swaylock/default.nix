{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "232136";
    bs-hl-color = "eb6f92";
    key-hl-color = "9ccfd8";
    font = "Ubuntu";
    indicator-radius = "50";
    indicator-thickness = "10";
    line-uses-inside = true;
    separator-color = "23213600";

    inside-color = "232136";
    ring-color = "3e8fb0";
    text-color = "e0def4";

    text-caps-lock-color = "f6c177";

    inside-clear-color = "f6c177";
    ring-clear-color = "f6c177";
    text-clear-color = "232136";

    inside-ver-color = "3e8fb0";
    ring-ver-color = "3e8fb0";
    text-ver-color = "232136";

    inside-wrong-color = "eb6f92";
    ring-wrong-color = "eb6f92";
    text-wrong-color = "232136";
  };
}
