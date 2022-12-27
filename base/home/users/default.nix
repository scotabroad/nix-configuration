{ name, fullName, email, config, inputs, pkgs, ... }:

{
  home = {
    homeDirectory = "/home/${name}";
    username = name;
  };

  programs.git = {
    userName = fullName;
    userEmail = email;
  };
}
