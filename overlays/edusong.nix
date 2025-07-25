{ pkgs, ... }:

final: prev: {
  edusong = prev.edusong.overrideAttrs (oldAttrs: {
    src = prev.fetchzip {
      name = "edusong-1.0";
      url = "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip";
      #sha256 = "0000000000000000000000000000000000000000000000000000";
      sha256 = "sha256-4NBnwMrYufeZbgSiD2fAhe4tuy0aAA5u9tWwjQQjEQk=";
    };
  });
}
