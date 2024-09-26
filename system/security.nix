{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "negatethis@envs.net";
      server = "https://ca.nixos.server:4663/acme/acme/directory";
    };
    certs = {
      "mqtt.nixos.server" = {
        domain = "mqtt.nixos.server";
        group = "mosquitto";
        webroot = "/var/lib/acme/acme-challenge";
      };
    };
  };
}
