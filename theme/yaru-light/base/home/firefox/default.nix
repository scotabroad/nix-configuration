{ config, name, inputs, pkgs, ... }:

{
  programs.firefox.profiles.${name} = {
    settings = {
      #Make UI more GNOME-like
      "browser.uiCustomization.state" = "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"new-tab-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"customizableui-special-spring2\",\"library-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"TabsToolbar\"],\"currentVersion\":18,\"newElementCount\":1}";

      # Enable customChrome.css
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      # Set UI density to normal
      "browser.uidensity" = 0;

      # Enable SVG context-properties
      "svg.context-properties.content.enabled" = true;

      # Disable private window dark theme
      "browser.theme.dark-private-windows" = false;
    };
  };
  home.file.".mozilla/firefox/${name}/chrome".source = pkgs.firefox-yaru-theme;
}
