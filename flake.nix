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
      # Die Neovimflocke ist noch nicht bereit für die aktuelle Version. 
      # Aktuell hängt sie noch hinterher
      # Stand 2024-07-05 geht die Neovimflocke mit ner aktuellen Version kaputt.
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
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
        home-manager.extraSpecialArgs = { inherit inputs; };
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
