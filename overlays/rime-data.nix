{ pkgs, ... }:

final: prev: {
  rime-data = prev.rime-data.overrideAttrs (oldAttrs: {
    preBuild = (oldAttrs.preBuild or "") + ''
      ln -sv ${
        prev.fetchFromGitHub {
          owner = "shinzoqchiuq";
          repo = "rime-trjuwngkux";
          rev = "1c302a20e3cc3cefd1720dd43b381ef6fe899f97";
          hash = "sha256-lzQJwJ6n6YyFloJJmz8AnOGIXOYs0ECG/VfvAZdn1qE=";
        }
      } package/rime/trjuwngkux
      ln -sv ${
        prev.fetchFromGitHub {
          owner = "gkovacs";
          repo = "rime-vietnamese";
          rev = "9194314e3b3723cea6232cd596e51c481366d1b7";
          hash = "sha256-HrEkPoecRE5JG51jaZzw1CJfO+Eoa4McgZpIRZPDleg=";
        }
      } package/rime/vietnamese
    '';
    prePatch = (oldAttrs.prePatch or "") + ''
      sed -i '/stenotype/a \
          trjuwngkux\
          vietnamese' extra-packages.conf
    '';
    #ibus-rime still cannot find the packages, though they appear in its directory
    #rime-data/plum may still be at fault, but so perhaps librime?
  });
}
