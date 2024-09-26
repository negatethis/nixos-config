{
  services.jellyfin = {
    enable = true;
    user = "negatethis";
    group = "users";
    dataDir = "/mnt/jellyfin";
    openFirewall = true;
  };
}
