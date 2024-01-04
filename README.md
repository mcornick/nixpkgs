# Mark's nixpkgs

This is a [Nix](https://nixos.org/) repository for software I have written. It is automatically maintained by [GoReleaser](https://goreleaser.com/).

## Usage

Add to `~/.config/nixpkgs/config.nix`:

```
{
  packageOverrides = pkgs: {
    mcornick = import (builtins.fetchGit { url = "https://git.sr.ht/~mcornick/nixpkgs"; }) {
      inherit pkgs;
    };
  };
}
```

and/or add to `/etc/nixos/configuration.nix`:

```
{
  nixpkgs.config.packageOverrides = pkgs: {
    mcornick = import (builtins.fetchGit { url = "https://git.sr.ht/~mcornick/nixpkgs"; }) {
      inherit pkgs;
    };
  };
}
```

and then `nix-env -iA nixos.mcornick.clilol`
