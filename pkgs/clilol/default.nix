# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    i686-linux = "05cxmn60yjjdfbxxn2g95gzhm1p0c2xw5dxg26nhknhx853p3gbl";
    x86_64-linux = "0lm2lvjnrzx0p9svrjcrzrjvsw5aiqmzf1srlys465v36hxjx2ap";
    armv6l-linux = "0scs62a3zyyfyfk6m82i6j2g8p84wddaygx3dzrcv1z52b5025sr";
    aarch64-linux = "0640kay2lrp98cjfhw87zc11ynr51smwq7nxw27h3rl85p0mlf5z";
    x86_64-darwin = "1dhyvcm8jik95cjd224mciqvhy9ggmvagljm2fxdy2chm7yvgji2";
    aarch64-darwin = "1dhyvcm8jik95cjd224mciqvhy9ggmvagljm2fxdy2chm7yvgji2";
  };

  urlMap = {
    i686-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_linux_386.tar.gz";
    x86_64-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_linux_amd64.tar.gz";
    armv6l-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_linux_armv6.tar.gz";
    aarch64-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_linux_arm64.tar.gz";
    x86_64-darwin = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_darwin_all.tar.gz";
    aarch64-darwin = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.10/clilol_1.0.10_darwin_all.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "clilol";
  version = "1.0.10";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./clilol $out/bin/clilol
    installManPage ./manpages/*.1
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "A CLI for omg.lol";
    homepage = "https://clilol.readthedocs.io/";
    license = lib.licenses.mpl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
