{
  description = "Liam Petrie's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, nix-matlab, ... }:
    let
      system = "x86_64-linux";

      config = nixpkgs.config;
      lib = nixpkgs.lib;

      make-packages = ps: attrs:
        import ps ({
          inherit system;
          config.allowUnfree = true;
        } // attrs);

      pkgs = make-packages nixpkgs {
        
	overlays = [

	  # Unstable Overlay
          (final: prev:
            let unstable = make-packages nixpkgs-unstable { };
            in {
              eww = unstable.eww;
	      nix = unstable.nix;
	      nordic = unstable.nordic;
	      nordzy-icon-theme = unstable.nordzy-icon-theme;
              steam = unstable.steam;
	      vivaldi = unstable.vivaldi;
            })

        ]
	++ import ./overlays { inherit pkgs; }
	++ import ./packages { inherit lib pkgs; };
      };

      flake-overlays = [
        nix-matlab.overlay
      ];

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          (import ./configuration.nix flake-overlays)
          nixos-hardware.nixosModules.framework
          home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	      home-manager.users.liamdp = import ./home.nix;
          }
        ];
      };

  };
}
