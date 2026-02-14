{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    st-nix = {
      url = "github:TQ-See/st-flexipatch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    Bloodrage-plymouth = {
      url = "github:TQ-See/NixPlymouth-Bloodrage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      ################################
      # change 'bspwm' to dotfiles u want to use
      #### Available Dotfiles = 
      #### bspwm, hyrpland, niri, 
      url = "github:msalmanrafadhlih/Dotfiles/bspwm";
      # url = "path:./bspwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    ############################
    # - Set your System, Username and Hostname here!!
    system = "x86_64-linux";
    username = "tquilla";
    hostname = "nixos";
    flakePath = self.outPath;
  in
  {
    nixosConfigurations.${hostname} =
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username hostname flakePath; };
        modules = [
          ########################
          ## SYSTEM CONFIGURATIONS
          ./system/configuration.nix

          ########################
          ## HOME-MANAGER CONFIGURATIONS
          inputs.dotfiles.nixosModules.default
          inputs.st-nix.nixosModules.default

          ########################
          { ## 🧩 OVERLAYS
            nixpkgs.overlays = [
              inputs.Bloodrage-plymouth.overlays.default
            ];
          }
        ];
      };
  };
}




