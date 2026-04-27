{...}: {
  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  imports = [
    ./programs/desktoppr
  ];
}
