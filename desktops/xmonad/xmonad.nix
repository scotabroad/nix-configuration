{ config, pkgs, inputs, ... }:

{

  # Set up Environment
  environment = {
    # Environment Variables for DPI fixes
    variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1"; # 2 ruins MARS MIPS, have to do 1 as only integers are accepted
      _JAVA_AWT_WM_NONREPARENTING = "1"; # MATLAB Fix
    };
  };
  
  # 2nd step taffybar fix
  gtk.iconCache.enable = true;
  
  #Programs specific to my xmonad sessions
  programs = {
    # Enable backlight
    light.enable = true;
  };

  #Services specific to my xmonad sessions
  services = {
    #Configure backlight
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';

    #Upower is needed for taffybar to read the battery
    upower.enable = true;

    # Xserver options specific to xmonad
    xserver = {
      displayManager = {
        defaultSession = "none+xmonad";
        # 1st step taffybar workaround
        sessionCommands = ''
	  systemctl --user import-environment GDK_PIXBUF_MODULE_FILE_DBUS_SESSION_BUS_ADDRESS PATH
	'';
      };

      # 3rd step taffybar workaround
      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

      # Enable touchpad support (enabled default in most desktopManagers)
      libinput = {
        enable = true;
	mouse = {
	  accelProfile = "flat";
	  accelSpeed = null;
	  disableWhileTyping = true;
	};
	touchpad = {
	  accelProfile = "adaptive";
	  accelSpeed = null;
	  additionalOptions = "";
	  buttonMapping = null;
	  calibrationMatrix = null;
	  clickMethod = "clickfinger";
	  dev = null;
	  disableWhileTyping = true;
	  horizontalScrolling = true;
	  leftHanded = false;
	  middleEmulation = false;
	  naturalScrolling = true;
	  scrollButton = null;
	  scrollMethod = "twofinger";
	  sendEventsMode = "enabled";
	  tapping = false;
	  tappingDragLock = false;
	  transformationMatrix = "3 0 0 0 3 0 0 0 1";
	};
      };
      # Need one desktop manager or window manager, otherwise stuck with xterm
      windowManager.xmonad = {
        enable = true;
	enableContribAndExtras = true;
	extraPackages = haskellPackages: [
	  haskellPackages.xmonad
	  haskellPackages.xmonad-contrib
	  haskellPackages.xmonad-extras
	];
      }; # end windowManager module
    }; # end xserver module
  }; # end services module
}
