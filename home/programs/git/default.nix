{ ... }: {

  programs.git = {
    enable = true;

    settings = {
      user.name = "mitsiu-carreno";
      #user.email = secrets.git.personalEmail;

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vim";

    };

    includes = [
      {
        condition = "gitdir:*/upa/";
        contents = {
          user = {
            name = "MACS-KINCAID";
          };
        };
      }
      {
        condition = "gitdir:*/designa/";
        contents = {
          user = {
            name = "designa-mitsiu";
          };
        };
      }
    ];
  };
}
