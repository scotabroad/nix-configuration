{ pkgs, ... }:

let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
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
        command = "${pkgs.swaylock}/bin/swaylock -f"; 
      }
      {
        timeout = 3600; #in seconds
        command = suspendScript.outPath;
      }
    ];
    systemdTarget = "graphical-session.target";
  };
}
