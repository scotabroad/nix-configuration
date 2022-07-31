{ config, inputs, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  
  wallpaper = pkgs.writeShellScriptBin "wallpaper" ''
    #!${pkgs.zsh}

    #variable=$(command -args)
    #args come in the form of $1, $2, etc.

    #check if $1 exists, quit if no
    #[[ ]] is a file in for 'test'
    #Use [ ] to be portable with older shells
    #test -e returns true if file exists
    #test -f returns true only if file is a regular file and not a directory or device
    if [[ -f "$1" ]]; then
      #set wallpaper
      ln -sf $1 $HOME/Wallpaper && feh --bg-fill --no-fehbg $HOME/Wallpaper
    else
      echo "$1 does not exist"
    fi
  '';
in {

  imports = [
    ./programs/zsh
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamdp";
  home.homeDirectory = "/home/liamdp";

  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nord-vim
      nvim-treesitter
      lualine-nvim
      nvim-web-devicons
    ];
    extraConfig = ''
      let g:nord_disable_background = v:true
      colorscheme nord
      set number
      lua << EOF
      require('nvim-treesitter.configs').setup {
        ensure_installed = {"bash", "c", "cpp", "css", "html", "java", "json", "lua", "nix", "vim"},
	sync_install = false,
	highlight = {
	  enable = true,
	},
      }
      require('lualine').setup {
        options = {
	  icons_enabled = true,
	  theme = 'nord',
	  component_separators = { left = '', right = ''},
	  section_separators = { left = '', right = ''},
	  disabled_filetypes = {},
	  always_divide_middle = true,
	  globalstatus = false,
        },
        sections = {
          lualine_a = {'mode'},
	  lualine_b = {'branch', 'diff', 'diagnostics'},
	  lualine_c = {'filename'},
	  lualine_x = {'encoding', 'fileformat', 'filetype'},
	  lualine_y = {'progress'},
	  lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
	  lualine_b = {},
	  lualine_c = {'filename'},
	  lualine_x = {'location'},
	  lualine_y = {},
	  lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    '';
  };

  # Manage picom
  services.picom = {
    enable = true;
    inactiveOpacity = "1.00";
    activeOpacity = "1.00";
    backend = "glx";
    experimentalBackends = false;
    shadow = false;
    extraOptions = ''
      corner-radius = 20
    '';
    vSync = true;
  };

  # Manage eww
  programs.eww = {
    enable = true;
    configDir = ../eww;
    package = unstable.eww;
  };

  # Manage kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = "Ubuntu Mono Nerd Font Complete Mono";
      package = null;
      size = 24;
    };
    settings = {
	background_opacity = "0.9";
    };
    theme = "Nord";
  };

  # Manage git
  programs.git = {
    enable = true;
    userName = "Liam Petrie";
    userEmail = "liamdpetrie@vivaldi.net";
    extraConfig = { 
      core = { 
        editor = "nvim"; 
      };
      init = { 
        defaultBranch = "main";
      };
    };
  };
  
  dconf.enable = true;
  
  # Manage Gtk Themes
  gtk = {
    enable = true;
    
    theme = {
      name = "Nordic";
      package = unstable.nordic;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = unstable.nordzy-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Nordzy-dark";
      gtk-theme-name = "Nordic";
      gtk-application-prefer-dark-theme = 0;
    };
  };

  # Additional Packages
  home.packages = with pkgs; [
    cinnamon.nemo
    dconf
    discord
    element-desktop
    exa
    feh
    gnome.gedit
    gtk-engine-murrine
    imagemagick
    libreoffice
    trayer
    wallpaper
    unstable.vivaldi
    zplug
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
