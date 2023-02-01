{ config, inputs, pkgs, ... }:

{
  # Manage Neovim
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-bash
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-comment
          tree-sitter-cmake
          tree-sitter-css
          tree-sitter-html
          tree-sitter-haskell
          tree-sitter-java
          tree-sitter-json
          tree-sitter-latex
          tree-sitter-markdown
          tree-sitter-nix
          tree-sitter-rust
          tree-sitter-scheme
          tree-sitter-scss
          tree-sitter-vim
          tree-sitter-yaml
        ]
      ))
      vim-numbertoggle
      vim-parinfer
      yuck-vim
    ];
  };
}

