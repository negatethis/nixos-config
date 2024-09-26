{
  services.music-assistant = {
    enable = true;
    providers = [
      "airplay"
      "apple_music"
      "builtin"
      "chromecast"
      "dlna"
      "filesystem_local"
      "hass"
      "hass_players"
      "jellyfin"
      "opensubsonic"
      "radiobrowser"
      "snapcast"  
    ];
  };
}
