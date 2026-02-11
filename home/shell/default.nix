{
  imports = [
    ./bash.nix  # enable bash too just so home-manager can manage it
    ./zsh.nix
  ];

  catppuccin = {
    bat = {
      enable = true;
      flavor = "mocha";
    };

    fzf = {
      enable = true;
      flavor = "mocha";
    };
  };
  
  # shell completion 
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # better cd
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.eza = {
    enable = true;
    icons = "auto";

    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
