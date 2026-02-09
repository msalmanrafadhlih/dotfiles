# ./modules/applications.nix
{ config, dotfiles, ... }:

let
  branch = dotfiles;
  home = config.home.homeDirectory;

  dotfiles_path = "${home}/.dotfiles/${branch}";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  locals = import ./launchers.nix ;
in
{

  # /home/user custom file
  home.file = builtins.mapAttrs (name: subpath: {source =
   create_symlink "${dotfiles_path}/${subpath}";
   recursive = true;
  }) locals;
}
