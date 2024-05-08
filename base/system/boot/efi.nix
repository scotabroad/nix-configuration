{ config, pkgs, inputs, ... }:

{
  # Boot Options
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxKernel.packages.linux_6_8; # Latest

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
        efiInstallAsRemovable = true; #Good for Framework BIOS updates
        efiSupport = true;
        font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/UbuntuMonoNerdFontMono-Regular.ttf";
        fontSize = 28;
        theme = pkgs.nixos-grub-theme;
        # splashImage = null;
        splashMode = "normal";
        useOSProber = false; # enable only if dual booting
      };

      # Disable systemd-boot
      systemd-boot.enable = false;
    };

    # Supported Filesystems
    supportedFilesystems = [
      "btrfs"
      "ntfs"
    ];
  };
}

