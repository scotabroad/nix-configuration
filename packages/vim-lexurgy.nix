{ pkgs }:

final: prev: {
  vimPlugins = prev.vimPlugins // {
    vim-lexurgy = prev.vimUtils.buildVimPlugin {
      pname = "vim-lexurgy";
      version = "2021-11-26";
      src = pkgs.fetchFromGitHub {
        owner = "daemanos";
        repo = "vim-lexurgy";
        rev = "4608be50bbcf2949bf197075587f08196006a580";
        hash = "sha256-p5XRqa9bfyWjmNjCZYwnrPY1Uu1wyYn2hqVcMhvMRZs=";
      };

      patches = [./vim-lexurgy.patch];
    };
  };
}
