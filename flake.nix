{
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "https://git.sr.ht/~mcornick/nur";
  outputs = { self, nixpkgs }:
    let
      systems = [
        "i686-linux"
        "x86_64-linux"
        "armv6l-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      legacyPackages = forAllSystems (system: import ./default.nix {
        pkgs = import nixpkgs { inherit system; };
      });
      packages = forAllSystems (system: nixpkgs.lib.filterAttrs (_: v: nixpkgs.lib.isDerivation v) self.legacyPackages.${system});
    };
}
