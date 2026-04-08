{config, ...}: {
  fileSystems."/mnt/Furcht968-SSD" = {
    device = "/dev/disk/by-id/usb-ELECOM_ESD-EJ_006F00600940-0:0-part1";
    fsType = "ntfs-3g";
  };
}
