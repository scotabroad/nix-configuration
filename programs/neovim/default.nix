{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nord-vim
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-bash
	  tree-sitter-c
	  tree-sitter-cpp
	  tree-sitter-comment
	  tree-sitter-cmake
	  tree-sitter-css
	  tree-sitter-html
	  tree-sitter-java
	  tree-sitter-json
	  tree-sitter-latex
	  tree-sitter-nix
	  tree-sitter-rust
	  tree-sitter-scheme
	  tree-sitter-scss
	  tree-sitter-vim
        ]
      ))
      nvim-web-devicons
      vim-parinfer
      (pkgs.callPackage ./yuck-vim.nix {} )
    ];
    extraConfig = ''
      let g:nord_disable_background = v:true
      colorscheme nord
      set number
      lua << EOF
      require('nvim-treesitter.configs').setup {
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

