{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # BSPWM Stuff
    polybarFull
    sxhkd
    picom
    eww
    geany

    killall
    xclip
    dpkg
    imlib2
    xorg.xinit
    xorg.xsetroot
    xorg.xrandr
    xorg.xinput

    brightnessctl
    libcanberra-gtk3
    sound-theme-freedesktop
    pamixer
    xdotool
    xarchiver
    mpv
    acpi
    dunst
		qview

		cachix
  ];

  services = {
  #############################
  ## WINDOW MANAGER SETTINGS
  #############################
    xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
        windowManager = {
            bspwm.enable = true;
        };
        autoRepeatDelay = 300;
        autoRepeatInterval = 35;
        displayManager = {
        	startx.enable = true;
        	lightdm = {
        		enable = true;
		        background = builtins.fetchurl {
		          url = "https://raw.githubusercontent.com/msalmanrafadhlih/Nixos-Dotsfile/refs/heads/main/config/Assets/Wallpaper/wallpaper8.jpeg";
		          sha256 = "sha256-VZp1wy2N0GApt48ILRY+pIAhAjCt02GmqmxHRTWAEoA=";
		        };
        	};
        };
    };

  ###################################
  ## XDG + GTK SETTINGS
  #####################################
	dbus.enable = true;
    dbus.packages = with pkgs; [ dconf ];
		udisks2.enable = true;
		gvfs = {
	        enable = true;
	        package = pkgs.gnome.gvfs;
	    };
  };

  ###################################
  ## THUNAR OPTIMALIZATION
  #####################################
  programs = {
		thunar = {
			enable = true;
			plugins = with pkgs.xfce; [
				thunar-volman
				thunar-dropbox-plugin
				thunar-vcs-plugin
				thunar-media-tags-plugin
			];
		};
  };
  services.tumbler.enable = true; # thumbnails di Thunar  

  #####################################
  ## XDG PORTAL (X11 Only)
  #####################################
	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;
		extraPortals = with pkgs; [
		  xdg-desktop-portal-gtk
		];
	};
	environment.sessionVariables = {
		XDG_CURRENT_DESKTOP = "bspwm";
		XDG_SESSION_TYPE = "x11";
	};
	xdg.mime.enable = true;
	# xdg.mime.defaultApplications = { };
	
  #####################################
  ## ⚡ Nix Daemon & Build Optimization
  #####################################
  nix.settings = {
    extra-experimental-features = ["nix-command" "flakes"];
    # pastikan sama seperti di nixConfig
    extra-substituters = [
      "https://spicetify-nix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "spicetify-nix.cachix.org-1:jjnwULkvMdu0E5KGBbtgrISEfDdJTGSZ4ATkiFzZn5I="
    ];
    auto-optimise-store = true;
    warn-dirty = false;
  };
}
