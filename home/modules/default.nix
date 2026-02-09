#./modules/default.nix
{
 imports = [
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
 ]; 
}
