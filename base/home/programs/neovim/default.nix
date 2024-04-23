{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      #(nvim-treesitter.withPlugins (
      #  plugins: with plugins; [
      #    tree-sitter-nix
      #  ]
      #))
      { plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require('nvim-treesitter.configs').setup {
            highlight = {
              enable = true,
            },
          }
        '';
      }
      vim-lexurgy
      vim-numbertoggle
      vim-parinfer
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      set number
      autocmd FileType c setlocal et ts=4 sw=4
      autocmd FileType cc setlocal et ts=4 sw=4
      autocmd FileType cpp setlocal et ts=4 sw=4
      autocmd FileType h setlocal et ts=4 sw=4
      autocmd FileType hs setlocal et ts=4 sw=4
      autocmd FileType nix setlocal et ts=2 sw=2
    '';
  };
}
