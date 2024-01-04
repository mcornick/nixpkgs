{ pkgs ? import <nixpkgs> { } }:

{
  clilol = pkgs.callPackage ./pkgs/clilol { };
}
