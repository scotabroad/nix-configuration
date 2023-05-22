{ config, inputs, pkgs, ... }:

{
  virtualisation = {
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
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
