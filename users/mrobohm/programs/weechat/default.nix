{ pkgs, lib, config, ... }:

let
  weechat = pkgs.weechat.override {
    configure = { availablePlugins, ... }: {
      scripts = [ pkgs.weechatScripts.weechat-matrix ];
    };
  }; 
in {
  #home.file.".weechat/python/autoload/notify_send.py".source = "${inputs.weechat-notify-send}/notify_send.py";
  #home.file.".weechat/perl/autoload/multiline.pl".source = "${inputs.weechat-scripts}/perl/multiline.pl";
  #home.file.".weechat/python/autoload/go.py".source = "${inputs.weechat-scripts}/python/go.py";
  home.packages = [ weechat ];
}
