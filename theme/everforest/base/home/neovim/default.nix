{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      everforest
      lualine-nvim
      nvim-web-devicons
    ];
    #For g:everforest_transparent_background, 0 is off, 1 is on, and 2 also applies to status bars like lualine
    #For g:everforest_better_performance, keep at 0 as 1 requires writing to the read-only nix store which is a big no
    extraConfig = ''
      if has('termguicolors')
        set termguicolors
      endif
      set background=dark
      let g:everforest_background = 'hard'
      let g:everforest_transparent_background = 2
      let g:everforest_better_performance = 0
      colorscheme everforest
      set number
      autocmd FileType c setlocal et ts=4 sw=4
      autocmd FileType cc setlocal et ts=4 sw=4
      autocmd FileType cpp setlocal et ts=4 sw=4
      autocmd FileType h setlocal et ts=4 sw=4
      autocmd FileType nix setlocal et ts=2 sw=2
      lua << EOF
      require('nvim-treesitter.configs').setup {
        highlight = {
	        enable = true,
	      },
      }
      require('lualine').setup {
        options = {
	        icons_enabled = true,
	        theme = 'everforest',
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

