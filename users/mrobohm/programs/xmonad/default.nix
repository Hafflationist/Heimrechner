{ isMinimal }:
{
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hp: [
        hp.dbus
        hp.monad-logger
        hp.taffybar
      ];
      config = if isMinimal then ./configMinimal.hs else ./config.hs;
    };
  };
}
