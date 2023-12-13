{ pkgs }:

final: prev: {
  vimPlugins = prev.vimPlugins // {
    yuck-vim = prev.vimUtils.buildVimPlugin {
      pname = "yuck.vim";
      version = "2021-08-09";
      src = pkgs.fetchFromGitHub {
        owner = "elkowar";
        repo = "yuck.vim";
        rev = "6dc3da77c53820c32648cf67cbdbdfb6994f4e08";
        hash = "sha256-lp7qJWkvelVfoLCyI0aAiajTC+0W1BzDhmtta7tnICE=";
      };
    };
  };
}
