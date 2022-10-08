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
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/master";
    nix-matlab = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "gitlab:doronbehar/nix-matlab";
    };
    #taffybar = {
    #  inputs.nixpkgs.follows = "nixpkgs";
    #  url = "github:taffybar/taffybar";
    #};
  };

  outputs = { 
    self, 
    flake-utils, 
    nixpkgs, 
    nixpkgs-unstable, 
    home-manager, 
    nixos-hardware, 
    nix-matlab, 
    #taffybar, 
    hyprland, 
    ... 
  }:
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
	    #(import ./desktops/xmonad/taffybar/overlay.nix)
	    nix-matlab.overlay
        ]
	++ import ./overlays { inherit pkgs; }
	++ import ./packages { inherit lib pkgs; };
	#++ taffybar.overlays;
      };

    in {

      # nixos is my hostname (lame, I know)
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
	modules = [
          ./configuration.nix
          hyprland.nixosModules.default
	  nixos-hardware.nixosModules.framework
          home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.liamdp = import ./home-manager/home.nix;
	     };
          }
        ];
      };
    };
}
