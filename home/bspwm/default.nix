# ./bspwm/default.nix
 
{ config, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  home = config.home.homeDirectory;
  branch = "bspwm";
  dotfiles_path = "${home}/.dotfiles/${branch}";

  configs = {
		bspwm = "bspwm";
		polybar = "bspwm/polybar";
		sxhkd = "bspwm/sxhkd";
		picom = "picom";
		rofi = "rofi";
		dunst = "dunst";
		# eww = "eww";
		
		nano = "nano";
		tmux = "tmux";
		rmpc = "rmpc";
		# ncmpcpp = "ncmpcpp";
		fastfetch = "fastfetch";
		btop = "btop";
		kitty = "kitty";
		helix = "helix";
		"com.kdocker" = "com.kdocker";

#  		alacritty = "alacritty";
#		"gtk-3.0" = "gtk-3.0";
#		ghostty = "ghostty";

		"vesktop/themes" = "vesktop/themes";
  };

in

{
  # Symlink path to ~./config/*
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;
  
}
