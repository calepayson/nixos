{
    description = "A NixOS configuration by calepayson";

    nixConfig = {
        # Substituters will be appended to the default substituters when
        # fetching packages
        extra-substituters = [
            "https://hyprland.cachix.org"
        ];
        extra-trusted-public-keys = [
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];
    };


    inputs = {
        # NixOS official package source, using the nixos-23.11 branch here
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland = {
            url = "github:hyprwm/Hyprland/v0.33.1";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ {
        self, 
            nixpkgs, 
            home-manager,
            ... 
    }: {
        nixosConfigurations = {
            beaker = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/beaker

                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        home-manager.extraSpecialArgs = inputs;
                        home-manager.users.cale = import ./home/core/core.nix;
                    }
                ];
            };

            kermit = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                ];
            };
        };
    };
}
