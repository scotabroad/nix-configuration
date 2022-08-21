{
  inputs = {
    taffybar.url = github:taffybar/taffybar;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, flake-utils, taffybar, nixpkgs }:
    let
    overlay = import ./overlay.nix;
    overlays = taffybar.overlays ++ [ overlay ];
  in flake-utils.lib.eachDefaultSystem (system:
  let pkgs = import nixpkgs { inherit system overlays; config.allowBroken = true; };
  in
  rec {
    devShell = pkgs.haskellPackages.shellFor {
      packages = p: [ p.my-taffybar p.taffybar ];
      nativeBuildInputs = with pkgs.haskellPackages; [
        cabal-install hlint ghcid ormolu implicit-hie haskell-language-server
      ];
    };
    defaultPackage = pkgs.haskellPackages.my-taffybar;
  }) // { inherit overlay overlays; } ;
}
