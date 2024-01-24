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
    i686-linux = "0lnni615l0yllyhdgf55yvbyc21v81fc6sbjc1c3ff0mj1iwwq96";
    x86_64-linux = "028v3gzizf7dvkcj3v7lr7igs8i9y9pkv3wfs3kj7cxwfcz1yx4b";
    armv6l-linux = "10y0qryk0vipn3wwhkfihca92ni36m1xladxkl4mbx4x4bj5xd5p";
    aarch64-linux = "1vk8jw8gvm1hsd5s3mwi1gqxz846sgxbarlrnxfz941avmhp2lql";
    x86_64-darwin = "1zv75jnai285y8q79cznh0ggsvzz1cs8975y228p1m5ijg6kxisw";
    aarch64-darwin = "1zv75jnai285y8q79cznh0ggsvzz1cs8975y228p1m5ijg6kxisw";
  };

  urlMap = {
    i686-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_linux_386.tar.gz";
    x86_64-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_linux_amd64.tar.gz";
    armv6l-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_linux_armv6.tar.gz";
    aarch64-linux = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_linux_arm64.tar.gz";
    x86_64-darwin = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_darwin_all.tar.gz";
    aarch64-darwin = "https://git.mcornick.dev/mcornick/clilol/releases/download/v1.0.11/clilol_1.0.11_darwin_all.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "clilol";
  version = "1.0.11";
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
