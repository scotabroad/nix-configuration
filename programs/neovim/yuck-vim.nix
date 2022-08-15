{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "yuck.vim";
  src = pkgs.fetchFromGitHub {
   owner = "elkowar";
     repo = "yuck.vim";
     rev = "6dc3da77c53820c32648cf67cbdbdfb6994f4e08";
     sha256 = "lp7qJWkvelVfoLCyI0aAiajTC+0W1BzDhmtta7tnICE=";
  };
}
