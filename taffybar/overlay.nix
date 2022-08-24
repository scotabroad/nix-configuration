final: prev: {
  haskellPackages = prev.haskellPackages.override (old: {
    overrides = prev.lib.composeExtensions (old.overrides or (_: _: {}))
      (self: super: {
        my-taffybar = self.callCabal2nix "my-taffybar"
          (final.lib.sourceByRegex ./. [
	    "taffybar.hs" 
	    "my-taffybar.cabal"
	    ]) { };
      });
  });
}
