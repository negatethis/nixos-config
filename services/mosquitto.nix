{ config, ... }:

{
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        users.negatethis = {
          acl = [
            "readwrite #"
          ];
          hashedPassword = "not-my-pass :P";
        };

        settings = let
          certDir = config.security.acme.certs."mqtt.nixos.server".directory;
        in {
          keyfile = certDir + "/key.pem";
          certfile = certDir + "/cert.pem";
          cafile = certDir + "/chain.pem";
        };
      }
    ];
  };
}
