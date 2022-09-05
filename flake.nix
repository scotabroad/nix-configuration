{
  description = "Liam Petrie's Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
    taffybar = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:taffybar/taffybar";
    };
  };

  outputs = { self, flake-utils, nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, nix-matlab, taffybar, ... }:
    let
      system = "x86_64-linux";

      config = nixpkgs.config;
      lib = nixpkgs.lib;

      make-packages = ps: attrs:
        import ps ({
          inherit system;
          config.allowUnfree = true;
	  config.allowBroken = true;
        } // attrs);

      pkgs = make-packages nixpkgs{
        
	overlays = [

	  # Unstable Overlay
          #(final: prev:
          #  let unstable = make-packages nixpkgs-unstable { };
          #  in {
          #    eww = unstable.eww;
	  #    nix = unstable.nix;
	  #    nordic = unstable.nordic;
	  #    nordzy-icon-theme = unstable.nordzy-icon-theme;
          #    steam = unstable.steam;
	  #    vivaldi = unstable.vivaldi;
          #  })

	    (import ./config/taffybar/overlay.nix)

	    nix-matlab.overlay

        ]
	++ import ./overlays { inherit pkgs; }
	++ import ./packages { inherit lib pkgs; }
	++ taffybar.overlays;
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
	      home-manager.users.liamdp = import ./home-manager/home.nix;
          }
        ];
      };

  };
}
