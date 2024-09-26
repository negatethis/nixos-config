{ pkgs, ... }:

{
  networking = { 
    firewall = {
      enable = true;
      
      # 22 ssh, 53 dns, 80 and 443 http/s
      # 8097 Music Assistant
      # 8123 Home Assistant
      allowedTCPPorts = [ 22 53 80 443 8097 8123 ];
      allowedUDPPorts = [ 53 80 443 ];
    };

    nat = {
      enable = true;
      externalInterface = "end0";
    };
  };    
}
