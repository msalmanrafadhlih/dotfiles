{ config, inputs, lib, pkgs, ... }:

let
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  
  branch = "bspwm";
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${branch}";
  repo_url = "https://github.com/msalmanrafadhlih/dotfiles.git";

  locals = import ./modules/locals.nix;
in

{
  home.username = "tquilla";
  home.homeDirectory = "/home/tquilla";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  
  home.activation = {
    setupDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      # Buat folder .dotfiles jika belum ada
      mkdir -p ${dotfiles_path}
      
      if [ ! -d "${dotfiles_path}/.git" ]; then
        echo "--- Cloning Dotfiles dari GitHub (${branch}) ---"
        ${pkgs.git}/bin/git clone -b ${branch} ${repo_url} "${dotfiles_path}"
      else
        echo "--- Dotfiles sudah ada, melakukan check update (safe) ---"
        cd "${dotfiles_path}"
        # Melakukan fetch saja agar tidak merusak kerjaan lokal
        ${pkgs.git}/bin/git fetch origin ${branch}
        echo "Gunakan 'git pull --rebase' secara manual di folder dotfiles jika ingin sinkronisasi."
      fi
    '';
  };
  
  # /home/user custom file
  home.file = builtins.mapAttrs (name: subpath: {source =
   create_symlink "${dotfiles_path}/${subpath}";
   recursive = true;
  }) locals;

 imports = [
  ./modules
  ./bspwm
  # ./btm
  # ./cosmic
  ./fastfetch
  # ./firefox
  # ./gemini
  ./git
  # ./gtk
  # ./helix
  # ./inlyne
  ./kitty
  ./lazygit
  # ./nwg-drawer
  # ./rofi
  # ./serpl
  ./shell
  # ./starship
  # ./swayimg
  # ./thunderbird
  # ./virtmanager
  # ./wezterm
  ./yazi
  # ./zathura
  # ./zellij
  inputs.catppuccin.homeModules.catppuccin
	# inputs.spicetify-nix.homeManagerModules.default
 ];
}
