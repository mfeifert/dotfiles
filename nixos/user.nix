{ config, pkgs, ... }:

{
  imports =
    [
    ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  users.users.maf = {
    isNormalUser = true;
    description = "Matthew";
    extraGroups = [ "networkmanager" "wheel" "wireshark" "libvirtd" ];
    packages = with pkgs; [
      firefox
      dropbox
      emacs29-gtk3
      ed
      nvi
      vim
      neovim
      helix
      micro
      ledger
      hledger
      mpv
      wireshark
      yazi
      mc
      ripgrep
      fzf
      bat
      sqlite
      sqlitebrowser
      neofetch
      eza
      nerdfonts
      gnome.gnome-tweaks
      gnome.gnome-boxes
    ];
  };

#  These git settings only work in Home Manager
#  programs.git = {
#    enable = true;
#    userName = "Matthew Feifert";
#    userEmail = "55014056+mfeifert@users.noreply.github.com";
#    extraConfig = {
#      init.defaultBranch = "main";
#    };
#  };

  programs.wireshark.enable = true;
  programs.virt-manager.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

}
