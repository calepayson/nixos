{
  imports = [
    ../tui/tui.nix

    ./hyprland/default.nix
    ./nvim/default.nix
  ];

  programs = {
      firefox.enable = true;
  };
}
