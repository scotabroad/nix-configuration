{ pkgs, ... }:

final: prev: {
  nordic = prev.nordic.overrideAttrs (oldAttrs: {
    pname = "nordic";
    version = "unstable-2023-10-17";

    srcs = [
      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "b27dffddd05c7cc05c71f2f854a3c1a3389cac91";
        hash = "sha256-9wAuTF7vCE5KlpF12qYo5s3qlBOaA6ZT/vPz7ie2xho=";
        name = "Nordic";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "d6e0727ea18134f0f5ea49c2fbbb7c4fcc84a349";
        hash = "sha256-cxvYnFso+xDm2f5SnV+8M53ZnGNoK/1S8LExcLI5DY4=";
        name = "Nordic-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "9e98cf74e325152a714be23806002af8765bc820";
        hash = "sha256-tAM0deW+1et/AN8lmb51ZL7qdeRopjUWdUbksLbYOxo=";
        name = "Nordic-darker";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "1d621a2400797643b5b13126408414c8e3462e4c";
        hash = "sha256-5gJ/XVO1WZVTcTwBjmzbCW5ZPn4j9Snapf9VNaPzLtA=";
        name = "Nordic-darker-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "5c8c8a81e1fb2cccd0a0648062097dde05c033e1";
        hash = "sha256-cZLMDeTCdcWrgm//B6P52F8LufdGs9Z5d10zhFK3trI=";
        name = "Nordic-bluish-accent";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "6b0550dd1111f04ada8426db8bdd1d0b9ca68421";
        hash = "sha256-glf5ZRbzz3iepIDfVqMuzwGIaYBISLeSJyAELbXMvDU=";
        name = "Nordic-bluish-accent-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "eca772a68450c69ba4af20fad57322cf3acba5b2";
        hash = "sha256-m59aXwqwlrXRtmqsABQ5G7qazY92a7cHsmBqChhCHuE=";
        name = "Nordic-Polar";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "219589387d57ccc2a01ca17f1f7812b7d30cb3a8";
        hash = "sha256-gG97Mk3QV+tURMXspBbcdcStF3RXGkUtc+QYkE2hDTQ=";
        name = "Nordic-Polar-standard-buttons";
      })
    ];
  });
}
