{
  description = "NixOS-Heimrechner";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    weechat-scripts = {
      type = "github";
      owner = "weechat";
      repo = "scripts";
      flake = false;
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-flocke = {
      url = "github:Hafflationist/neovim-flocke";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    homeConfig = import ./users/mrobohm/home.nix;
    standardModules = isMinimal: [
      ./configuration.nix
      ./users/mrobohm/programs/spicetify
      #inputs.spicetify-nix.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.mrobohm = homeConfig { isMinimal = isMinimal; };
      }
    ];
  in 
  {
    nixosConfigurations = {
      heimrechner = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = standardModules false;
      };
      klapprechner = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = standardModules true;
      };
    };
  };
}
