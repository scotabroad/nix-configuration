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
    userChrome =
      builtins.readFile ./symbolic-tab-icons.css
    + builtins.readFile ./system-icons.css
    
    + builtins.readFile ./colors/dark.css
    + builtins.readFile ./colors/light.css

    + builtins.readFile ./parts/remove-white-flash.css
    
    + builtins.readFile ./parts/dialogs.css
    + builtins.readFile ./parts/popups-contents.css
    + builtins.readFile ./parts/popups.css

    + builtins.readFile ./parts/icons.css
    + builtins.readFile ./parts/controls.css
    + builtins.readFile ./parts/entries.css
    + builtins.readFile ./parts/buttons-fixes.css
    + builtins.readFile ./parts/buttons.css

    + builtins.readFile ./parts/toolbox.css
    + builtins.readFile ./parts/headerbar.css
    + builtins.readFile ./parts/headerbar-private-window.css
    + builtins.readFile ./parts/csd.css
    + builtins.readFile ./parts/urlbar.css
    + builtins.readFile ./parts/tabsbar.css
    + builtins.readFile ./parts/findbar.css
    + builtins.readFile ./parts/sidebar.css
    + builtins.readFile ./parts/lists.css
    + ''
    #customization-footer::before {
            background: url(./icons/icon.svg) no-repeat;
            background-size: contain;
            content: "Firefox GNOME theme v110";
            padding: 9px 9px 9px 50px;
    }
    '';
    
    userContent = 
      builtins.readFile ./colors/dark.css
    + builtins.readFile ./colors/light.css
    + builtins.readFile ./pages/newtab.css
    + builtins.readFile ./pages/privatebrowsing.css
    + builtins.readFile ./parts/video-player.css;
  };
  home.file.".mozilla/firefox/${name}/chrome/icons".source = ./icons;
}
