{ pkgs, ... }:

final: prev: {
  discord = (prev.discord.override { nss = pkgs.nss_latest;}).overrideAttrs (_: {
    src = builtins.fetchTarball {
      url = "https://discord.com/api/download?platform=linux&format=tar.gz";
      #sha256 = "0000000000000000000000000000000000000000000000000000";
      sha256 = "1pw9q4290yn62xisbkc7a7ckb1sa5acp91plp2mfpg7gp7v60zvz";
    };
  });
}
