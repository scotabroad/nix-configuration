{ pkgs, ... }:

final: prev: {
  nordic = prev.nordic.overrideAttrs (oldAttrs: {
    pname = "nordic";
    version = "unstable-2024-02-13";

    srcs = [
      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "357e37fd0abc38ced6d01e5b84deac77fb19ba29";
        hash = "sha256-mp9F6uXjpkpyb9c2hnKWYEVh9sJbjHSnGs8iKFn211I=";
        name = "Nordic";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "ad6d1674ba4d8d0f728ebf7d2e3c6300cb4ed09d";
        hash = "sha256-5Jfc3u0n/Sux1D2dikgytjoLavOB5xQCysoHE6EuI+g=";
        name = "Nordic-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "76bed202eac80c1c8eb44b8e6e3321e1cb97d10b";
        hash = "sha256-+qZDOsTTQ10Eiz6AwE7vHfi/gemudqoJh/9RC/QjYpk=";
        name = "Nordic-darker";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "89c80ee66c9e3b1861d275b696b035e5cba71c78";
        hash = "sha256-fiacO4Hkl53pjVQqSDKaz7HbqcHiOax/gTb6eVFnOVk=";
        name = "Nordic-darker-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "50d9212723b9183c8b804875b79d7ec28c989f63";
        hash = "sha256-hy27uqRwQZyXkt/2yUi+evz0tmXzLeJeT0fHjA0cUW4=";
        name = "Nordic-bluish-accent";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "a770a157dcb1e3fdeba6927d26ba3ffc8ff2bc1f";
        hash = "sha256-BmR8e5A/KwWl31eowQtwnjXyMuXEAuvd4Cqo0kvmZRg=";
        name = "Nordic-bluish-accent-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "ccfb35e3aaa635be24e1045ea92bd95d603bf125";
        hash = "sha256-vAD1TJcPMsyuR6pjD4btZ7Lv62n3b53LqQxpG04XyBc=";
        name = "Nordic-Polar";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "bcb0e896478154efc87c046ecbae806697855ee2";
        hash = "sha256-DY9VuLZHleBjjp8ig29NjbwizoQOx1mkYLFvkyBV3v4=";
        name = "Nordic-Polar-standard-buttons";
      })
    ];
  });
}
