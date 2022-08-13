{
  description = "Liam Petrie's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, ... }:
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

          # Discord Overlay
          (self: super: {
            discord = super.discord.overrideAttrs (_: {
              src = builtins.fetchTarball {
                url = "https://discord.com/api/download?platform=linux&format=tar.gz";
                sha256 = "1kwqn1xr96kvrlbjd14m304g2finc5f5ljvnklg6fs5k4avrvmn4";
              };
            });
          })

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
	++ import ./packages { inherit lib pkgs; };
      };

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./configuration.nix
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
