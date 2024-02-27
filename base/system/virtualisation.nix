{ config, inputs, pkgs, ... }:

{
  virtualisation = {
    #Docker
    docker = {
      enable = false;
      storageDriver = "btrfs";
    };
    #Virt-Manager
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        swtpm.enable = true; #Simulate a TPM
        ovmf = {
          enable = true;
          packages = with pkgs; [ 
            OVMFFull.fd
            #pkgsCross.aarch64-multiplatform.OVMF.fd broken for now
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virtiofsd
  ];
  services.spice-vdagentd.enable = false; #this is for guests
}
