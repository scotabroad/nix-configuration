{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, glib
, gtk4
, pango
}:

rustPlatform.buildRustPackage rec {
  pname = "regreet-git";
  version = "unstable-2023-04-29";

  src = fetchFromGitHub {
    owner = "rharish101";
    repo = "ReGreet";
    rev = "ccffff87f621d9ea0d3c0f6ca64b361509d1dbc3";
    hash = "sha256-6VdM7W8Sx+D6Lp8LijuWWvGhRS+QIW4CWn1OATGqBPc=";
  };

  cargoHash = "sha256-eIApTeVDi/KLUGn3PwU26+MekpKRTvXnDxg2MV9pG0w=";

  buildFeatures = [ "gtk4_8" ];

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ glib gtk4 pango ];

  meta = with lib; {
    description = "Clean and customizable greeter for greetd";
    homepage = "https://github.com/rharish101/ReGreet";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ scotabroad ];
    platforms = platforms.linux;
  };
}
