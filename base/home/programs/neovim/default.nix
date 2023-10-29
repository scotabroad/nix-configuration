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
      nvim-treesitter.withAllGrammars
      vim-lexurgy
      vim-numbertoggle
      vim-parinfer
      yuck-vim
    ];
    vimdiffAlias = true;
  };
}

