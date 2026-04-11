{ pkgs, ... }:

final: prev: {
  edusong = prev.edusong.overrideAttrs (oldAttrs: {
    src = prev.fetchzip {
      name = "edusong-4.0";
      url = "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip";
      #sha256 = "0000000000000000000000000000000000000000000000000000";
      sha256 = "sha256-+wH6I0sOfzytstDNT81LMuqknGQuYekl31e1tYaDvRg=";
    };

    installPhase = ''
      mkdir -p $out/share/fonts/
      cp $src/edusong_Unicode*.ttf $out/share/fonts/eduSong_Unicode.ttf
    '';
  });
}
