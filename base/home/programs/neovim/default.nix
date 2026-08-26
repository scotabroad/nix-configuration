{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      vim-lexurgy
      vim-numbertoggle # have 'set number' in extraConfig to use
      # vim-parinfer # ain't using Lisp, Clojure, or Scheme
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = true;
    extraConfig = ''
      set number
      autocmd FileType c setlocal et ts=4 sw=4
      autocmd FileType cc setlocal et ts=4 sw=4
      autocmd FileType cpp setlocal et ts=4 sw=4
      autocmd FileType h setlocal et ts=4 sw=4
      autocmd FileType haskell setlocal et ts=4 sw=4
      autocmd FileType nix setlocal et ts=2 sw=2
    '';
  };
}
