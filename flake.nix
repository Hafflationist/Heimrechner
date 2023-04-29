{
  description = "NixOS-Heimrechner";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nurpkgs = {
      url = github:nix-community/NUR;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tex2nix = {
      url = github:Mic92/tex2nix/4b17bc0;
      inputs.utils.follows = "nixpkgs";
    };
    gtk-sni-tray.url = github:taffybar/gtk-sni-tray/master;
    gtk-strut.url = github:taffybar/gtk-strut/master;
  };

  outputs = inputs @ { self, nixpkgs, nurpkgs, home-manager, tex2nix, gtk-sni-tray, gtk-strut }:
  let
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations = {
      heimrechner = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
          }
        ];
      };
    };
  };
}
