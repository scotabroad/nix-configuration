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
  version = "unstable-2023-09-28";

  src = fetchFromGitHub {
    owner = "rharish101";
    repo = "ReGreet";
    rev = "4dfbc1983229cbc79672794985a3412146f9eacd";
    hash = "sha256-Bfsz8SlBrep8RC2wmkXUxtTUdtv2m/0DGignZDxd5qg=";
  };
  
  cargoHash = "sha256-ZLIREWzZngdrd9zy5GpXrULZRV+scugNA+mMDjKMbMU=";

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
