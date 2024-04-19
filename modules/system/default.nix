{ pkgs, lib, ... }: let
  username = "cale";
in {
  # Define user settings
  users.users.username = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  # Customize nix.conf delaratively via 'nix.settings'
  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  # Do weekly garbage collection to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Customize fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      #normal fonts
      noto-fonts
      noto-fonts-emoji

      # nerdfonts
      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];

    # use fonts specified by the user rather than the default ones
    enableDefaultPackages = false;

    # user defined fonts
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # Allow listening on port 22
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # List base packages installed with system profile.
  environment.systemPackages = with pkgs; [
    curl
    gh
    git
    kitty
    neofetch
    neovim
    vim
    wget
  ];

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
