{
  # inspired by: https://youtu.be/FYTZkE5BZ-0
  description = "music-maker";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        haskellPackages = pkgs.haskellPackages;

        packageName = "music-maker";
      in
      {
        packages.${packageName} =
          haskellPackages.callCabal2nix packageName ./. rec {
            # Dependency overrides go here
          };

        defaultPackage = self.packages.${system}.${packageName};

        # https://input-output-hk.github.io/haskell.nix/reference/library.html#shellfor
        devShells.default = haskellPackages.shellFor {
          packages = p: [ self.packages.${system}.${packageName} ];

          withHoogle = true;

          buildInputs = with haskellPackages; [
            pkgs.ffmpeg_5-full  # for ffplay
            haskell-language-server
            ghcid
            cabal-install
          ];
        };
      });
}
