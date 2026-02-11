{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    obs-studio.enable = true;  
    zed-editor.enable = true;
  };
  
  home.packages = with pkgs; [
    # GUI
    ungoogled-chromium
    # gimp
    timg
    zoom
    libreoffice
    evince # Document Viewer
    xarchiver
	  gparted # Manage Disk Partition
	  vesktop
    # font-manager
    # picard
    # godot
    # protonvpn-gui
    # qbittorrent
    # winboat

    # # GAMING
    # heroic
    # lutris
    
    # CLI TOOLS
	  ani-cli
	  rmpc
	  kitty
	  helix

    # UTILS
    jellyfin-ffmpeg
    ffmpeg-full
  ];
}
