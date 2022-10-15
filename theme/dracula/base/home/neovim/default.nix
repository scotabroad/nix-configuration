{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      dracula-vim
      nvim-web-devicons
    ];
    extraConfig = ''
      lua << EOF
      vim.cmd('let g:dracula_colorterm = 0')
      vim.cmd('colorscheme dracula')
      vim.cmd('set number')
      require('nvim-treesitter.configs').setup {
	highlight = {
	  enable = true,
	},
      }
      require('lualine').setup {
        options = {
	  icons_enabled = true,
	  theme = 'dracula',
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
