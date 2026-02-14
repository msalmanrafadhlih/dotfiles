# ./modules/configuration.nix
 
{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/fileSystems.nix
    # ./modules/kanata.nix
    ./modules/locale.nix
    ./modules/network.nix
    ./modules/hardware.nix
    # ./modules/power.nix
    ./modules/system-packages.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
    
    ./modules/autoupdate.nix
    ./modules/fonts.nix
    ./modules/openssh.nix
    ./modules/shell.nix
    ./modules/sudo.nix
    ./modules/touchpad.nix
    ./modules/boot.nix
    ./modules/settings.nix

    # ./modules/power.nix
    # ./modules/acme.nix
    # ./modules/nginx.nix
  ];


  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.11";
  security.rtkit.enable = true;
}
