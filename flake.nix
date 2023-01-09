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
    nur.url = "github:nix-community/NUR";
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
        nur.overlay
      ]
      ++ import ./overlays { inherit pkgs; }
      ++ import ./packages { inherit lib pkgs; };
      };

      #User info
      name = "liamdp";
      fullName = "Liam Petrie";
      email = "liamdpetrie@vivaldi.net";
      uid = 1000;

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./theme/rose-pine/desktops/hyprland/system/default.nix
          hyprland.nixosModules.default
          nixos-hardware.nixosModules.framework
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
                imports = [ ./theme/rose-pine/desktops/hyprland/home/default.nix ];
                _module.args = { inherit fullName email uid; };
              };   
            };
          }
        ];
      };
    };
}
