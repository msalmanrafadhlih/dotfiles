{
  programs.git = {
    enable = true;
    
    settings = {
      user.name = "msalmanrafadhlih";
      user.email = "141149698+msalmanrafadhlih@users.noreply.github.com";

      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };

      push.autoSetupRemote = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true; # Ini default-nya true, dia yang akan set core.pager
    options = {
      line-numbers = true;
      side-by-side = true;
    };
  };
}
