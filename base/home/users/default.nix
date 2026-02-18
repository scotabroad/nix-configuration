{ name, fullName, email, config, inputs, pkgs, ... }:

{
  home = {
    homeDirectory = "/home/${name}";
    username = name;
  };

  programs.git.settings = {
    user = {
      name = fullName;
      email = email;
    };
  };
}
