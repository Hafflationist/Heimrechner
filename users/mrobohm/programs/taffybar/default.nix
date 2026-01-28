{pkgs, ...}: let
  custom-panel-launch = pkgs.writeScriptBin "custom-panel-launch" ''
    #!/${pkgs.stdenv.shell}
    killall custom-taffybar
    status-notifier-watcher &
    while true; do custom-taffybar; done
  '';
  custom-taffybar =
    (import ./customTaffybar/default.nix) {inherit pkgs;};
in {
  home.packages = with pkgs; [
    # custom-panel-launch
    # custom-taffybar
    # haskellPackages.status-notifier-item
  ];

  home.file.".config/taffybar/taffybar.css".source = ./taffybar.css;
  home.file.".config/taffybar/colors.css".text = ''
    @define-color font-color #ccccce;
    @define-color accent #c50ed2;
    @define-color bg rgba(13, 13, 27, 0.5);
    @define-color bg-alt rgba(13, 13, 27, 0.8);
    @define-color red #ff4444;
    @define-color menu-background-color @bg;
    @define-color menu-background-color-selected @bg-alt;
    @define-color menu-font-color @font-color;
  '';
}
