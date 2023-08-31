{
  description = "Repro conditions for prisma/prisma#20905";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";

      in
      {
        devShell = with pkgs; mkShell {
          packages = [
            nodejs-18_x
            sqlite
          ];
        };
      });
}

