{username, ...}: {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.sessionPath = [
    "/home/${username}/.local/bin"
  ];
}
