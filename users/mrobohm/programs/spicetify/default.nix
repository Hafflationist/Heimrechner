



{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.nixosModules.default ];

  # configure spicetify :)
  programs.spicetify =
  {
    enable = true;
    colorScheme = "Purple";
    #customColorScheme = {
    #  text = "f8f8f8";
    #  subtext = "f8f8f8";
    #  sidebar-text = "79dac8";
    #  main = "000000";
    #  sidebar = "323437";
    #  player = "000000";
    #  card = "000000";
    #  shadow = "000000";
    #  selected-row = "7c8f8f";
    #  button = "74b2ff";
    #  button-active = "74b2ff";
    #  button-disabled = "555169";
    #  tab-active = "80a0ff";
    #  notification = "80a0ff";
    #  notification-error = "e2637f";
    #  misc = "282a36";
    #};

    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      bookmark
    ];
  };
}
