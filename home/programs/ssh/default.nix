{...}: {
  programs.ssh = {
    enable = true;

    # create unmanaged path for tools that auto-write
    #includes = [ "~/.ssh/config_local" ];

    enableDefaultConfig = false;

    extraConfig = ''
      ServerAliveInterval 60
      ServerAliveCountMax 3
      ForwardAgent no
    '';

    matchBlocks = {
      "*" = {
      };

      "github-default" = {
        match = ''host github.com !exec "pwd | grep -Eq 'designa|upa'"'';
        identityFile = "~/.ssh/id_ed25519";
      };

      "github-designa" = {
        match = ''host github.com exec "pwd | grep -q 'designa'"'';
        identityFile = "~/.ssh/id_ed25519_designa";
      };

      "github-upa" = {
        match = ''host github.com exec "pwd | grep -q 'upa'"'';
        identityFile = "~/.ssh/id_ed25519_upa";
      };

      "cluster" = {
        host = "cluster.220391.xyz";
        proxyCommand = "/usr/bin/cloudflared access ssh --hostname %h";
      };
    };
  };
}
