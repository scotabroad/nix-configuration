{ config, inputs, pkgs, ... }:

{
  programs.swaylock.settings = {
    color = "2e3440";
    bs-hl-color = "bf616a";
    key-hl-color = "a3be8c";
    font = "Ubuntu";
    indicator-radius = 50;
    indicator-thickness = 10;
    line-uses-inside = true;
    separator-color = "2e344000";

    inside-color = "2e3440";
    ring-color = "81a1c1";
    text-color = "eceff4";

    text-caps-lock-color = "ebcb8b";

    inside-clear-color = "ebcb8b";
    ring-clear-color = "ebcb8b";
    text-clear-color = "2e3440";

    inside-ver-color = "5e81ac";
    ring-ver-color = "5e81ac";
    text-ver-color = "2e3440";

    inside-wrong-color = "bf616a";
    ring-wrong-color = "bf616a";
    text-wrong-color = "2e3440";
  };
}
