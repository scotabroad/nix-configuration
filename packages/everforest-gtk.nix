{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "everforest-gtk-theme";
  version = "unstable-2023-03-20";

  src = fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Everforest-GTK-Theme";
    rev = "8481714cf9ed5148694f1916ceba8fe21e14937b";
    hash = "sha256-NO12ku8wnW/qMHKxi5TL/dqBxH0+cZbe+fU0iicb9JU=";
  };

  dontBuild = true;
  
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share
    cp -r themes $out/share
  '';

  meta = with lib; {
    description = "Everforest GTK Theme";
    homepage = "https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme";
    platforms = platforms.linux;
    maintainers = [ maintainers.scotabroad ];
  };
} 
