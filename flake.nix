let
  dotfiles = "bspwm";
in
{
  description = "BSPWM - NixOS Home Configuration ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    zjstatus.url = "github:dj95/zjstatus";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-flavors = {
      url = "github:yazi-rs/flavors";
      flake = false;
    };

    yazi-compress = {
      url = "github:KKV9/compress.yazi";
      flake = false;
    };

  };

  outputs = { home-manager, ... }@inputs:
  {
    # Output untuk Standalone (command: home-manager switch)
    # homeConfigurations."tquilla" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #   extraSpecialArgs = { inherit inputs; };
    #   modules = modulesList;
    # };

    # Output Baru: Module untuk di-import oleh Flake Utama (NixOS)
    nixosModules.default = { username, hostname, system, ... }: {
      imports = [
        home-manager.nixosModules.home-manager
      ###################################
      ## 🧩 Overlays & External Modules
      ###################################
        # {nixpkgs.overlays = [overlay-unstable];}
        # nur.modules.nixos.default

      ###################################
      ## 🧱 System Modules - BSPWM
      ###################################
        ./modules/bspwm.nix
      ];


      ###############################
      #### 🧱 Home-Manager Modules
      ###############################
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users = {
          # ./modules/default.nix ./home/default.nix
          tquilla = { imports = [ ./modules ./home ]; };
        };
        extraSpecialArgs = {
          inherit inputs system dotfiles username hostname;
        };
        backupFileExtension = "backup";
      };
    };
  };
}
