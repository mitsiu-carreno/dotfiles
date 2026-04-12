{config, ...}: {
  sops = {
    # Path to encrypted file
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    # Key used to decript 
    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    };

    secrets = {
      # by default lands at /run/user/$(id -u)/secrets/git_email_key
      "git-config/personal" = {
        path = "${config.home.homeDirectory}/.config/git/personal-config";
      };

      "git-config/upa" = {
        path = "${config.home.homeDirectory}/.config/git/upa-config";
      };

      "git-config/designa" = {
        path = "${config.home.homeDirectory}/.config/git/designa-config";
      };
    };
  };
}
