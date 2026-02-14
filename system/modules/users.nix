# ./modules/users.nix
{ pkgs, username, ... }:

{
  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    description = "Tquilla - Main User";
    shell = pkgs.zsh;

    #######################
    # 'mkpasswd -m sha-512'
    # or 'openssl passwd -6'
    hashedPassword = "$6$MxfcpoEAx/d9zgzd$xHQWzszUQAG9RWOfDamQybgX8PMxeZf9qS4.K12qEqgh31fQfZLR7OpxspjCRzSu5MU889MrqBykT/Vsaet6n0";

    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "kvm"
      "adbusers"
      "docker"
      "i2c"
    ];
  };
  # services.getty.autologinUser = "tquilla";
}
