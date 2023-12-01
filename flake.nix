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
      url = "github:hyprwm/Hyprland";
    };
    hyprland-plugins = {
      inputs.hyprland.follows = "hyprland";
      url = "github:hyprwm/hyprland-plugins";
    };
    #hyprpaper = {
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  url = "github:hyprwm/hyprpaper";
    #};
    #hyprpicker = {
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  url = "github:hyprwm/hyprpicker";
    #};
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    nur.url = "github:nix-community/NUR";
    xdg-desktop-portal-hyprland = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
    };
  };

  outputs = { 
    self, 
    flake-utils, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    nixos-hardware, 
    nur, 
    hyprland, 
    hyprland-plugins,
    xdg-desktop-portal-hyprland,
    ... 
  }@inputs:
    let
      system = "x86_64-linux";

      config = nixpkgs.config;
      lib = nixpkgs.lib;
      stdenv = nixpkgs.legacyPackages.${system}.stdenv;
      
      #make-packages = ps: attrs:
      #  import ps ({
      #    inherit system;
      #    config.allowUnfree = true;
      #    config.allowBroken = true;
      #  } // attrs);

      #pkgs = make-packages nixpkgs{
      #  
      #  overlays = [
      #    hyprland.overlays.default
      #    hyprpicker.overlays.default
      #    nur.overlay
      #  ]
      #  ++ import ./overlays { inherit pkgs; }
      #  ++ import ./packages { inherit lib pkgs; };
      #};

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
                hyprland.overlays.default
                #hyprpicker.overlays.default
                xdg-desktop-portal-hyprland.overlays.default
                nur.overlay
              ]
              ++ import ./overlays { inherit pkgs; }
              ++ import ./packages { inherit lib pkgs; };
            };
          })
          ./theme/nord/desktops/wayland/system.nix
          hyprland.nixosModules.default
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
                imports = [ ./theme/nord/desktops/wayland/home.nix ];
                _module.args = { inherit fullName email uid; };
              };   
            };
          }
        ];
      };
    };
}
