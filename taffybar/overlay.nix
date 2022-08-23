final: prev: {
  haskellPackages = prev.haskellPackages.override (old: {
    overrides = prev.lib.composeExtensions (old.overrides or (_: _: {}))
    (hself: hsuper: {
      my-taffybar = hself.callCabal2nix "my-taffybar"
      (
        final.lib.sourceByRegex ./.
        ["taffybar.hs" "my-taffybar.cabal"]
      )
      { };
    });
  });
}
