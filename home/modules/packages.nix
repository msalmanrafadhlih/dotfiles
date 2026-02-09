{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # fastfetch
    # rofi
    # gimp
    # vivaldi
    tmux

    nixpkgs-fmt
    # nodejs_24
    feh
    gcc

   #  font-manager
   #  picard
   #  jellyfin-ffmpeg
   #  ungoogled-chromium
   #  libreoffice
   #  zoom
   #  evince
   #  obs-studio
   #  flameshot
	  # helix
	  # gparted
  ];
}
