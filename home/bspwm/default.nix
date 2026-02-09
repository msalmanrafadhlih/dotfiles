# ./bspwm/default.nix
 
{ config, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  home = config.home.homeDirectory;
  branch = "bspwm";
  dotfiles_path = "${home}/.dotfiles/${branch}";

  configs = {
		bspwm = "bspwm";
		polybar = "polybar";
		sxhkd = "sxhkd";
  };

in

{
  # Symlink path to ~./config/*
  xdg.configFile = builtins.mapAttrs (name: subpath: {source =
    create_symlink "${dotfiles_path}/${subpath}";
    recursive = true;
  }) configs;
  
}
