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


      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      push.autoSetupRemote = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      side-by-side = true;
    };
  };
}
