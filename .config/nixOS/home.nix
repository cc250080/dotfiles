{ config, pkgs, ... }:

{
  home.username = "cortescc";
  home.homeDirectory = "/home/cortescc";
  home.stateVersion = "23.05";
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 16;
  };
  
  gtk.enable = true;
  gtk.font.name = "Noto Sans";
  gtk.font.package = pkgs.noto-fonts;
  gtk.theme.name = "Dracula";
  gtk.iconTheme.name = "Adwaita";  # Candy and Tela also look good
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = true;
    gtk-icon-theme-name   = "Adwaita";
    gtk-cursor-theme-name = "Bibata-Modern-Amber";
  };

  dconf.settings = {
      "org/gnome/desktop/interface" = {
        gtk-key-theme = "Emacs";
        cursor-theme = "Bibata-Modern-Amber";
      };
    };
#  xdg.systemDirs.data = [
#      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
#      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
#    ];
}
