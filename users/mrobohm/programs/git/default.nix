{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "hafflationist";
    userEmail = "internetzverbindung(an)gmail(punkt)com";
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "libsecret";
    };
  };
}
