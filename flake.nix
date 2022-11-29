{
  description = "Liam Petrie's Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/master";
    };
    hyprland = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:hyprwm/hyprland";
    };
    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { 
    self, 
    flake-utils, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    nixos-hardware, 
    hyprland,
    hyprpicker,
    ... 
  }@inputs:
    let
      system = "x86_64-linux";

      config = nixpkgs.config;
      lib = nixpkgs.lib;
      stdenv = nixpkgs.legacyPackages.${system}.stdenv;
      
      make-packages = ps: attrs:
        import ps ({
          inherit system;
          config.allowUnfree = true;
          config.allowBroken = true;
        } // attrs);

      pkgs = make-packages nixpkgs{
        
      overlays = [
        hyprpicker.overlays.default
      ]
      ++ import ./overlays { inherit pkgs; }
      ++ import ./packages { inherit lib pkgs; };
      };

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
	modules = [
          ./theme/rose-pine-moon/desktops/hyprland/system/default.nix
          hyprland.nixosModules.default
	  nixos-hardware.nixosModules.framework
          home-manager.nixosModules.home-manager {
	    home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.liamdp = import ./theme/rose-pine-moon/desktops/hyprland/home/default.nix;
	    };
          }
        ];
      };
    };
}
