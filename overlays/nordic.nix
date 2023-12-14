{ pkgs, ... }:

final: prev: {
  nordic = prev.nordic.overrideAttrs (oldAttrs: {
    pname = "nordic";
    version = "unstable-2023-12-13";

    srcs = [
      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "1d9405857a7e6de00d21ef6cbbb6829c395620ae";
        hash = "sha256-VAgqhBih2oVdFOr50+tq6LV+Eba3LdFN1mbRu5TNRys=";
        name = "Nordic";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "bb99b027da2a006e1078939a33671ea55a3ef68d";
        hash = "sha256-5tY6D6HR1NGDxvEmDC/0hUiIfXgYJ2jr5BOC+z1CAnM=";
        name = "Nordic-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "7f5c15b8de1c96587b320d933e4be983b201e040";
        hash = "sha256-tZ4fgKGTGaQ2wCbtYcVZmJZkSfd/WQuvBg5Nggc895s=";
        name = "Nordic-darker";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "55aa57ad6fc80d6bd327701145c291e41769eca0";
        hash = "sha256-1s3PWnN/DUKzoUK0AjldW7pY+MxhmRqPF669Anwp4zM=";
        name = "Nordic-darker-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "92a9257e49b07d959b817244c8593be01a13930b";
        hash = "sha256-wRX9A/bbb0ff3q20NPSonXt+ZxWFbMR1PCgO3ToiHLU=";
        name = "Nordic-bluish-accent";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "bbbc964228f5d82024593e030ac8119918978a59";
        hash = "sha256-FIwbL1vrU86zh18LnLKTQ6FcqyzlMowuWoQdWygFNSo=";
        name = "Nordic-bluish-accent-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "41345e27cd7271e63289641eb5f22979adbf7bab";
        hash = "sha256-OyHaOx58MmLR6FIzdf1wiwfeGAgP8s2B8q58TEYf+ws=";
        name = "Nordic-Polar";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "6c4bb6958ab9cdef67a4952dc8d2ca85e51e5a8c";
        hash = "sha256-P8wMTC2NHFeN8GniZ5NAOn57Ud9+cLo44kTbXsYigBs=";
        name = "Nordic-Polar-standard-buttons";
      })
    ];
  });
}
