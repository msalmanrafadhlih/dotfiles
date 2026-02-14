#./modules/default.nix
{ inputs, lib, pkgs, config, dotfiles, ... }:

let
  branch = dotfiles;
  home = config.home.homeDirectory;
  dotfiles_path = "${home}/.dotfiles/${branch}";
  repo_url = "https://github.com/msalmanrafadhlih/dotfiles.git";
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
				${pkgs.git}/bin/git clone -b ${branch} --single-branch --depth 1 ${repo_url} "${dotfiles_path}"
		  else
				echo "--- Dotfiles sudah ada, melakukan check update (safe) ---"
				cd "${dotfiles_path}"
				# Melakukan fetch saja agar tidak merusak kerjaan lokal
				${pkgs.git}/bin/git fetch origin ${branch}
				echo "Gunakan 'git pull --rebase' secara manual di folder dotfiles jika ingin sinkronisasi."
		  fi
		'';
  };
	imports = [
	  ./applications.nix
	  ./background.nix
	  ./bat.nix
	  ./battery.nix
	  ./bookmarks.nix
	  ./brightness.nix
	  ./colorscript.nix
	  ./git.nix
	  ./github-repos.nix
	  # ./git-prompt.nix
	  ./img-compress.nix
	  ./media.nix
	  ./mpd.nix # ----------
	  ./nanorc.nix
	  ./opencam.nix
	  ./packages.nix
	  ./picom.nix
	  ./reddit.nix
	  ./run.nix
	  # ./suckless.nix
	  ./tar.nix
	  ./tmux-sessions.nix
	  ./volume.nix
	  ./xsession.nix
	  # ./xdg-home.nix # backup error make me sick!!
	  ./xyz.nix
	  ./youtube.nix  

		inputs.catppuccin.homeModules.catppuccin
  ]; 
}
