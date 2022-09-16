{ pkgs, ... }:

final: prev: {
  discord = (prev.discord.override { nss = pkgs.nss_latest;}).overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://discord.com/api/download?platform=linux&format=tar.gz";
      sha256 = "0qaczvp79b4gzzafgc5ynp6h4nd2ppvndmj6pcs1zys3c0hrabpv";
    };
  });
}
