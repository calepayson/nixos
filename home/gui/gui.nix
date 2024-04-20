{ pkgs, ... }:

{
  imports = [
    ../tui/tui.nix

    ./hyprland/default.nix
    ./nvim/default.nix
  ];

  packages = with pkgs; [
      firefox
  ];

  # programs = {
  #     firefox.enable = true;
  # };
}
