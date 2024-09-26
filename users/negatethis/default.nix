{ pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home = {
    username = "negatethis";
    homeDirectory = "/home/negatethis";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
