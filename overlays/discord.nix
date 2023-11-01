{ pkgs, ... }:

final: prev: {
  discord = (prev.discord.override { nss = pkgs.nss_latest;}).overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://discord.com/api/download?platform=linux&format=tar.gz";
      #sha256 = "0000000000000000000000000000000000000000000000000000";
      sha256 = "1mm470lahyk0cz9zd6pfv7zhlvaw5gvqip68867lj2lw63r4zivx";
    };
  });
}
