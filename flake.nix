{
  description = "My NixConfig";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      rust-overlay,
      hyprpanel,
      hyprland,
      spicetify,
      sddm-sugar-candy-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        Ghylak = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs self; };
          modules = [
            ./nixos/common.nix
            ./nixos/ghylak/configuration.nix
            ./modules
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.sai = import ./home-manager/home.nix;
            }

            sddm-sugar-candy-nix.nixosModules.default
          ];
        };
        Murgo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs self; };
          modules = [
            ./nixos/common.nix
            ./nixos/murgo/configuration.nix
            ./modules
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.sai = import ./home-manager/home.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "sai@Ghylak" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/home.nix ];
        };
        "sai@Murgo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
