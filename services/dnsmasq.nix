{
  services.dnsmasq = {
    enable = true;
    alwaysKeepRunning = true;

    settings = {
      server = [ "1.1.1.1" "1.0.0.1" ];
      address = "/nixos.server/192.168.0.82";
    };
  };
}
