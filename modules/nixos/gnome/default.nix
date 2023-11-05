{ options, config, pkgs, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.trzpiot.gnome;
in
{
  options.trzpiot.gnome = {
    enable = mkEnableOption "Gnome";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      desktopManager.gnome.enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    # Enable Wayland support for Electron applications.
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Primary monitor is enabled - all other monitors are disabled for the login screen.
    systemd.tmpfiles.rules =
      let
        monitorsXmlContent = builtins.readFile ./monitors.xml;
        monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent;
      in
      [ "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}" ];
  };
}