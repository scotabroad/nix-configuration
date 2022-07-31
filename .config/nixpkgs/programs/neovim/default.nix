{ config, inputs, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
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
}

