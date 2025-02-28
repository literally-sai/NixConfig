{
  description = "A flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixvim, home-manager, hyprland, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;  
    };
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      Ghylak = lib.nixosSystem rec {
        inherit system;
        specialArgs = {
          inherit hyprland;
          inherit pkgs-stable;
          inherit nixvim;
        };
        modules = [
          ./configuration.nix
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.users.sai = import ./home/home.nix;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.sharedModules = [
              nixvim.homeManagerModules.nixvim
            ];
          }
	  ./hosts/hosts.nix
        ];
      };
    };
  };
}
