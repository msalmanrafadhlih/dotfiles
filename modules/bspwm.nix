{ pkgs, ... }:

{
  services = {
    xserver = {
        enable = true;
        windowManager = {
            bspwm.enable = true;
        };
        autoRepeatDelay = 300;
        autoRepeatInterval = 35;
        # displayManager = {
        # 	startx.enable = true;
        # 	lightdm = {
        # 		enable = true;
		      #   background = builtins.fetchurl {
		      #     url = "https://raw.githubusercontent.com/msalmanrafadhlih/Nixos-Dotsfile/refs/heads/main/config/Assets/Wallpaper/wallpaper8.jpeg";
		      #     sha256 = "sha256-VZp1wy2N0GApt48ILRY+pIAhAjCt02GmqmxHRTWAEoA=";
		      #   };
        # 	};
        # };
    };
    
#   displayManager = {
#       autoLogin.enable = true;
#       autoLogin.user = "whiskey";
#   };
  };
 
  environment.systemPackages = with pkgs; [
    # BSPWM Stuff
    polybarFull
    sxhkd
    picom
    eww

    ripgrep
    wget
    btop
    tree
    bat

    killall
    xclip
    dpkg
    unzip
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
  ];
}
