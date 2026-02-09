{
  description = "BSPWM - NixOS Home Configuration ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    zjstatus.url = "github:dj95/zjstatus";

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

  outputs = { nixpkgs, home-manager, ... }@inputs:

  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # Output untuk Standalone (command: home-manager switch)
    # homeConfigurations."tquilla" = home-manager.lib.homeManagerConfiguration {
    #   inherit pkgs;
    #   extraSpecialArgs = { inherit inputs; };
    #   modules = modulesList;
    # };

    # Output Baru: Module untuk di-import oleh Flake Utama (NixOS)
    nixosModules.default = { ... }: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users = {
          tquilla = import ./home;
        };
        extraSpecialArgs = {inherit inputs;};
        backupFileExtension = "backup";
      };

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
        ./bspwm.nix
      ];
    };
  };
}
