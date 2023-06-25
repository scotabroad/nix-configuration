{ config, inputs, pkgs, ... }:

{
  virtualisation = {
    #Docker
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
    #Virt-Manager
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_full;
        swtpm.enable = true; #Simulate a TPM
        ovmf = {
          enable = true;
          packages = with pkgs; [ 
            OVMFFull.fd
            pkgsCross.aarch64-multiplatform.OVMF.fd
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virtiofsd
  ];
  services.spice-vdagentd.enable = true;
}
