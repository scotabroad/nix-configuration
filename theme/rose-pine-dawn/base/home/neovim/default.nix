{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      rose-pine
      nvim-web-devicons
    ];
    extraConfig = ''
      autocmd FileType c setlocal et ts=4 sw=4
      autocmd FileType cc setlocal et ts=4 sw=4
      autocmd FileType cpp setlocal et ts=4 sw=4
      autocmd FileType h setlocal et ts=4 sw=4
      autocmd FileType nix setlocal et ts=2 sw=2
      lua << EOF
      require('rose-pine').setup({
        disable_background = true;
      })
      vim.cmd('set number')
      vim.cmd('colorscheme rose-pine')
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
        },
      }
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'rose-pine',
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

