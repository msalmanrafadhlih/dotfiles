{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    gimp
    vivaldi
    tmux
    timg

    nixpkgs-fmt
    feh
    gcc

    # font-manager
    # picard
    jellyfin-ffmpeg
    ungoogled-chromium
    libreoffice
    zoom
    evince
    obs-studio
    flameshot
	  helix
	  gparted
	  ani-cli
	  vesktop
	  kdocker
	  rmpc
	  kitty
	  geany
  ];
}
