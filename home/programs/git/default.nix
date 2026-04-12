{config, ...}: {
  programs.git = {
    enable = true;

    settings = {

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vim";
    };

    includes = [
      {
        path = "${config.home.homeDirectory}/.config/git/personal-config";
      }
      {
        condition = "gitdir:*/upa/";
        path = "${config.home.homeDirectory}/.config/git/upa-config";
      }
      {
        condition = "gitdir:*/designa/";
        path = "${config.home.homeDirectory}/.config/git/designa-config";
      }
    ];
  };
}
