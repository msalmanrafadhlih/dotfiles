{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellInit = builtins.readFile ./init-zsh.zsh ;

    # vim mode (helix mode plugins did not work for me)
    defaultKeymap = "viins";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = false;

    history = {
      append = true;
      findNoDups = true;
      ignoreSpace = true;
    };

    histSize = 2000;
    histFile = "$HOME/.config/zsh/.zsh_history";

	  setOptions = [
		"APPEND_HISTORY"
		"SHARE_HISTORY"
		"HIST_IGNORE_SPACE"
		"HIST_IGNORE_ALL_DUPS"
		"HIST_FCNTL_LOCK"
		"HIST_SAVE_NO_DUPS"
		"HIST_IGNORE_DUPS"
		"HIST_FIND_NO_DUPS"

		# "AUTOCD"
		# "PROMPT_SUBST"
		"MENU_COMPLETE"
		"LIST_PACKED"
		"AUTO_LIST"
		"COMPLETE_IN_WORD"
		"RM_STAR_WAIT"
	  ];
  };
}
