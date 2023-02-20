{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "hafflationist";
    userEmail = "internetzverbindung(an)gmail(punkt)com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
