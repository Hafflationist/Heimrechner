{pkgs, ...}: {
  home.packages = with pkgs; [
    delta
  ];
  programs.git = {
    enable = true;
    userName = "hafflationist";
    userEmail = "internetzverbindung(an)gmail(punkt)com";
    package = pkgs.gitFull;
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        # side-by-side = "true";
      };
    };
  };
}
