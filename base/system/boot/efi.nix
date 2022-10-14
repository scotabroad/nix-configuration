{ config, pkgs, inputs, ... }:

{
  # Boot Options
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages; # Latest LTS

    # Boot Loader settings
    loader = {
      # EFI settings
      efi = {
        efiSysMountPoint = "/boot";
	canTouchEfiVariables = false;
      };

      # Use the GRUB 2 boot loader.
      grub = {
        enable = true;
	backgroundColor = "#2f302f";
	device = "nodev"; # "nodev" for efi only
	efiInstallAsRemovable = true;
	efiSupport = true;
	font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/'Ubuntu Mono Nerd Font Complete Mono.ttf'";
	fontSize = 28;
	theme = pkgs.framework-grub-theme;
	# splashImage = null;
	splashMode = "normal";
	useOSProber = false; # enable only if dual booting
	version = 2;
      };

      # Disable systemd-boot
      systemd-boot.enable = false;
    };
  };
}

