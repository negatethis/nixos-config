{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    
    settings = {
      theme = "gruvbox_dark_hard";
      editor = {
        soft-wrap.enable = true;
        mouse = false;
      };
      
    };

    extraPackages = with pkgs; [
      nil
    ];
  };
}
