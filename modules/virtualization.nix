{ config, pkgs, ... }:

{
  # Load KVM module for Intel CPUs at boot
  boot.kernelModules = [ "kvm-intel" ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" "--volumes" "--filter" "until=168h" ];
    };
  };
}
