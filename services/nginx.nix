{ pkgs, ... }:

{

  services.nginx = {
    enable = true;
    
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    upstreams = {
      "backend_conduit" = {
        servers = {
          "[::1]:6167" = {};
        };
      };
    };

    virtualHosts = {
      "home.nixos.server" = {
        enableACME = true;
        forceSSL = true;
        
        extraConfig = ''
          proxy_buffering off;
        '';
        locations."/" = {
          proxyPass = "http://127.0.0.1:8123";
          proxyWebsockets = true;
        };
      };

      "ma.nixos.server" = {
        enableACME = true;
        forceSSL = true;
        
        locations."/" = {
          proxyPass = "http://127.0.0.1:8095";
          proxyWebsockets = true;
        };
      };

      "jellyfin.nixos.server" = {
        enableACME = true;
        forceSSL = true;
        
        locations."/" = {
          proxyPass = "http://127.0.0.1:8096";
          proxyWebsockets = true;
        };
      };
    };
  };
}
