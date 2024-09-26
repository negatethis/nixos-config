{ pkgs, ... }:

{
  services.home-assistant = {
    enable = true;

    package = (pkgs.home-assistant.override {
      extraPackages = py: with py; [ ];
      packageOverrides = final: prev: {
        certifi = prev.certifi.override {
          cacert = pkgs.cacert.override {
            extraCertificateFiles = [ ../certs/step-ca-root.crt ];
          };
        };
      };
    }).overrideAttrs (oldAttrs: { doInstallCheck = false; });

    extraComponents = [
      "met"
      "radio_browser"
      "google_translate"
      "shopping_list"
      "isal"
      "webostv"
      "mqtt"
      "minecraft_server"
      "caldav"
      "cast"
      "jellyfin"
    ];

    config = {
      default_config = {};      
      http = {
        use_x_forwarded_for = true;
        trusted_proxies = [ "127.0.0.1" ];
        ip_ban_enabled = true;
        login_attempts_threshold = 5;
      };
    };
  };
}
