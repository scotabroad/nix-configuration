{ config, inputs, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamdp";
  home.homeDirectory = "/home/liamdp";

  # Manage Zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      rm = "rm -i";
    };
    zplug = {
      enable = true;
      plugins = [
	{ name = "lib/clipboard"; tags = [ from:oh-my-zsh ]; }
	{ name = "lib/history"; tags = [ from:oh-my-zsh ]; }
	{ name = "lib/key-bindings"; tags = [ from:oh-my-zsh ]; }
	{ name = "lib/theme-and-appearance"; tags = [ from:oh-my-zsh ]; }
        { name = "plugins/command-not-found"; tags = [ from:oh-my-zsh ]; }
	{ name = "plugins/sudo"; tags = [ from:oh-my-zsh ]; }
	{ name = "ChrisPenner/copy-pasta"; }
	{ name = "zpm-zsh/ls"; }
	{ name = "zsh-users/zsh-syntax-highlighting"; }
	{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
    defaultKeymap = "emacs"; #emacs, vicmd, or viins (vim mode bad)
    history = {
      size = 5000;
      extended = true;
      ignoreDups = true;
      expireDuplicatesFirst = true;
      ignoreSpace = true;
      save =5000;
      path = "/home/liamdp/.zsh_history";
    };
    initExtra = ''
      export PATH=$PATH:/home/liamdp/bin
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

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

  #Manage eww
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

  #Additional Packages
  home.packages = [
    pkgs.cinnamon.nemo
    pkgs.dconf
    pkgs.discord
    pkgs.element-desktop
    pkgs.exa
    pkgs.feh
    pkgs.gnome.gedit
    pkgs.gtk-engine-murrine
    pkgs.imagemagick
    pkgs.libreoffice
    pkgs.lua
    pkgs.trayer
    unstable.vivaldi
    pkgs.zplug
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
