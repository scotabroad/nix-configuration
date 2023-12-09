{ pkgs, ... }:

let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
  lockScript = pkgs.writeShellScript "lock-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only lock if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/loginctl lock-session
    fi
  '';
in {
  # screen idle
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep"; #will run before systemd puts the system to sleep
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        event = "lock"; #when logind says session should be locked
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 300; #in seconds
        command = lockScript.outPath; 
      }
      {
        timeout = 3600; #in seconds
        command = suspendScript.outPath;
      }
    ];
    systemdTarget = "graphical-session.target";
  };
}
