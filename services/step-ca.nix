{
  services.step-ca = {
    enable = true;
    address = "0.0.0.0";
    port = 4663;
    openFirewall = true;
    intermediatePasswordFile = ../path/to/file;
    settings = {
      root = "/var/lib/step-ca/certs/root_ca.crt";
      crt = "/var/lib/step-ca/certs/intermediate_ca.crt";
      key = "/var/lib/step-ca/secrets/intermediate_ca_key";
      
      dnsNames = [
        "ca.nixos.server"
      ];
      
      logger = {
        format = "text";
      };

      db = {
        type = "badgerv2";
        dataSource = "/var/lib/step-ca/db";
      };

      authority = {
        provisioners = [
          {
            type = "JWK";
            name = "negatethis";
            key = {
              use = "sig";
              kty = "EC";
              kid = "";
              crv = "P-256";
              alg = "ES256";
              x = "";
              y = "";
      				encryptedKey = "my-encrypted-key :P";
            };
          }

          {
            type = "ACME";
            name = "acme";
            claims = {
              enableSSHCA = true;
              disableRenewal = false;
              allowRenewalAfterExpiry = false;
              disableSmallstepExtensions = false;
            };
          }
        ];
        backdate = "1m0s";
      };

      tls = {
        cipherSuites = [
          "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256"
          "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
        ];
        minVersion = 1.2;
        maxVersion = 1.3;
        renegotiation = false;
      };
      commonName = "Step Online CA";
    };
  };
}
