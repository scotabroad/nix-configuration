{ pkgs }:

final: prev: {
  wallpaper = pkgs.writeScriptBin "wallpaper" ''
    #variable=$(command -args)
    #args come in the form of $1, $2, etc.

    #check if $1 exists, quit if no
    #[[ ]] is a fill in for 'test'
    #Use [ ] to be portable with older shells
    #test -e returns true if file exists
    #test -f returns true only if file is a regular file and not a directory or device
    if [[ -f "$1" ]]; then
      # set wallpaper
      ln -sf $1 $HOME/Wallpaper && feh --bg-fill --no-fehbg $HOME/Wallpaper
    else
      echo "$1 does not exist"
    fi
  '';
}
