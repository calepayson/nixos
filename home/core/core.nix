{config, pkgs, home, ...}:

{
  imports = [
  ];

  home = {
    username = "cale";
    homeDirectory = "/home/cale";

    packages = with pkgs; [
      hello
    ];
  
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards 
    # incompatible changes.
    # 
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of the state version
    # changes in each release.
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
