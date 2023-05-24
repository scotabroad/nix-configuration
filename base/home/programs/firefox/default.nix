{ config, name, inputs, pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  #Firefox config
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.${name} = {
      isDefault = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        user-agent-string-switcher
      ];
      search = {
        default = "DuckDuckGo";
        engines = {
          "Arch Wiki" = {
            urls = [{
              template = "https://wiki.archlinux.org/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@aw" ];
          };
          "DuckDuckGo".metaData.alias = "@d";
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "type"; value = "options"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [{
              template = "https://nixos.wiki/index.php?search={searchTerms}";
            }];
            iconUpdateURL = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = [ "@nw" ];
          };
        };
        force = true;
        order = [
          "DuckDuckGo"
          "Nix Packages"
          "Nix Options"
          "NixOS Wiki"
          "Arch Wiki"
        ];
      };
    };
  };
}
