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
	  
  imports = [
	./applications.nix
	# ./bash.nix
	# ./zshrc.nix
	./packages.nix
	# ./bat.nix
	# ./xsession.nix
	# ./battery.nix
	# ./brightness.nix
	# ./volume.nix
	# ./media.nix
	# ./nanorc.nix
	# ./git-prompt.nix
	# ./tar.nix
	# ./xyz.nix
	# ./hide-polybar.nix
	# ./show-polybar.nix
	# ./background.nix
	# ./opencam.nix
	# ./bookmarks.nix
	# ./github-repos.nix
	# ./tmux-sessions.nix
	# ./run.nix
	# ./mpd.nix
	# ./xdg-home.nix
	# ./picom.nix
	# ./img-compress.nix
	# ./colorscript.nix
	# ./youtube.nix
	# ./reddit.nix

	# ./suckless.nix
	# ./firefox.nix ## This is for Whiskey, not for me! ~ Tquilla

	# comment "#" this if you don't want to use spotify with custom theme (spicetify)
	# ./spotify.nix

	inputs.catppuccin.homeModules.catppuccin
	# inputs.spicetify-nix.homeManagerModules.default
  ]; 
}
