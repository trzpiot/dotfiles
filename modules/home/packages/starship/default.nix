{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.trzpiot.packages.starship;
in
{
  options.trzpiot.packages.starship = {
    enable = mkEnableOption "Starship";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableTransience = true;

      settings = {
        # Source: https://draculatheme.com/starship
        aws.style = "bold #ffb86c";
        cmd_duration.style = "bold #f1fa8c";
        directory.style = "bold #50fa7b";
        hostname.style = "bold #ff5555";
        git_branch.style = "bold #ff79c6";
        git_status.style = "bold #ff5555";

        username = {
          format = "[$user]($style) on ";
          style_user = "bold #bd93f9";
        };

        character = {
          success_symbol = "[λ](bold #f8f8f2)";
          error_symbol = "[λ](bold #ff5555)";
        };
      };
    };
  };
}
