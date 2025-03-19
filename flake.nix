{
  description = "Banger Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprpanel.url = "github:jas-singhfsu/hyprpanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = 
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      rust-overlay,
      nixvim,
      spicetify-nix,
      hyprpanel,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        Ghylak = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/ghylak/configuration.nix
          ];
        };
        Murgo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/murgo/configuration.nix
          ];
        };
      };
    };
}