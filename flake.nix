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
    nur.url = "github:nix-community/NUR";
  };

  outputs = { 
    self, 
    flake-utils, 
    home-manager, 
    nixos-hardware, 
    nixpkgs, 
    nixpkgs-unstable, 
    nur, 
    ... 
  }@inputs:
    let
      system = "x86_64-linux";

      config = nixpkgs.config;
      lib = nixpkgs.lib;
      stdenv = nixpkgs.legacyPackages.${system}.stdenv;
      
      #User info
      name = "liamdp";
      fullName = "Liam Petrie";
      email = "liamdpetrie@vivaldi.net";
      uid = 1000;

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ({config, pkgs, ...}: {
            nixpkgs = {
              config = {
                allowUnfree = true;
                allowBroken = true;
              };
              overlays = [
                nur.overlay
              ]
              ++ import ./overlays { inherit pkgs; }
              ++ import ./packages { inherit lib pkgs; };
            };
          })
          ./theme/adwaita-dark/desktops/gnome/system/default.nix
          nixos-hardware.nixosModules.framework-11th-gen-intel
          home-manager.nixosModules.home-manager
          {
            #NixOS stuff
            _module.args = { inherit name fullName email uid; };
            
            #Home-manager stuff
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${name} = {
                imports = [ ./theme/adwaita-dark/desktops/gnome/home/default.nix ];
                _module.args = { inherit fullName email uid; };
              };   
            };
          }
        ];
      };
    };
}
