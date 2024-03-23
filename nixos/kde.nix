{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma desktop environment
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  users.users.maf.packages = with pkgs; [
    ];

}
