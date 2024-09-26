{
  boot = {
    loader = {
      # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
      grub.enable = false;
      
      # Enables the generation of /boot/extlinux/extlinux.conf
      generic-extlinux-compatible.enable = true;
    };

    initrd = {
      kernelModules = [ "usb_storage" ];

      luks.devices = {
        luks_drive = {
          device = "/dev/disk/by-id/ata-HGST_HTS541075A9E680_130405J8120077G5NKNA-part3";
          allowDiscards = true;
          keyFileSize = 4096;
          keyFile = "/dev/disk/by-id/usb-PNY_USB_2.0_FD_AA00000000006523-0:0";
          fallbackToPassword = true;
        };
      };
    };
  };
}
