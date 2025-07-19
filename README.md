# M Cornick's nixpkgs

This is a [Nix](https://nixos.org/) repository for software I have written. It is automatically maintained by [GoReleaser](https://goreleaser.com/).

## Usage

Add to your NixOS or Home Manager `flake.nix`:

```
inputs.mcornick = {
  url = "github:mcornick/nixpkgs";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Then to install `clilol` on a `x86_64-linux` system, add  `mcornick.packages.x86_64-linux.clilol` to (for instance) `environment.systemPackages` in your NixOS configuration, or to `home.packages` in your Home Manager configuration. If you're not on a `x86_64-linux` system, use your platform type instead.
