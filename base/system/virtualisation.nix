{ config, inputs, pkgs, ... }:

{
  virtualisation = {
    #Virt-Manager
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true; #Simulate a TPM
      };
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
