{ config, pkgs, ... }:

{
  services.openssh.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.firefox = {
    enable = true;
    preferences = {
      "media.navigator.enabled" = true;
      "media.navigator.video.enabled" = true;
      "media.getusermedia.enabled" = true;
      "media.webrtc.enabled" = true;
      "permissions.default.microphone" = 1;
      "permissions.default.camera" = 1;
    };
  };
}
