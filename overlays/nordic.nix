{ pkgs, ... }:

final: prev: {
  nordic = prev.nordic.overrideAttrs (oldAttrs: {
    pname = "nordic";
    version = "unstable-2024-01-25";

    srcs = [
      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "218a1a8679fdb97aa0aa7997fdf8c5344d68fb2f";
        hash = "sha256-a315U4HsQP1omluTJjq9U76L3ANP7uN831mCY54vZnk=";
        name = "Nordic";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "59873a54c8524adb36411d17d473eb7b7c910eac";
        hash = "sha256-RisW5W0onNrtsSPHtFW66OdrQWOQX3uDmLiM+5ckzSY=";
        name = "Nordic-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "6e2b8fb8017c34344ec6b70884f09ebb44863efb";
        hash = "sha256-B4qH8L5r16gaPS1wpiIHPyS3g/g53Xi2C6F0rcZKgWk=";
        name = "Nordic-darker";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "2160a7bc69f55dd0b9efa64f029344256a4ef086";
        hash = "sha256-1WdorWByZE4sXTfwsjFxvvSI0qQcAcfFoPXN5fGhEpc=";
        name = "Nordic-darker-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "63e0844bc04e1500e4b0ef8031cb3812e15e12fb";
        hash = "sha256-b0Zs2WsD913Ai8wvi7mPraFme93WZXm+7rnwhDvGuZM=";
        name = "Nordic-bluish-accent";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic";
        rev = "53e44ca5045a57903c0024197fa7a7a267432afb";
        hash = "sha256-vF2f4PuQP0QkmPT6kR35eWYvQ9xLCYihEsobERURuBk=";
        name = "Nordic-bluish-accent-standard-buttons";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "4ec6f09782394d24d4d8cc78ac53c4692ec28985";
        hash = "sha256-Z50ciafgfTHBahjpcVTapnsU88ioPUZ1RjggNpruJP0=";
        name = "Nordic-Polar";
      })

      (pkgs.fetchFromGitHub {
        owner = "EliverLara";
        repo = "nordic-polar";
        rev = "c6c7ee8e642a9df07f7d69ed048a6ef37a26153c";
        hash = "sha256-e+B9oUKbPr2MKmaz+l5GTOP4iVmw24vVpS98mAxEekA=";
        name = "Nordic-Polar-standard-buttons";
      })
    ];
  });
}
