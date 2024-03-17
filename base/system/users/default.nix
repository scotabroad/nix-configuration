{ name, uid, config, pkgs, inputs, lib, ... }:

let
  home = "/home/${name}";
in {
  # Define a user account. Don't forget to set a password with ‘passwd’. 
  users.users.${name} = {
    inherit name home uid;
    createHome = true;
    extraGroups = [ 
      "wheel"
      "video"
      "networkmanager"
      "libvirtd" #allows users access the virsh command
      #"docker" #NOTE: this is equivalent to being root!
    ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
