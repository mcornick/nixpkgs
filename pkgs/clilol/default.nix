# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "0i5mb0n4k2g8w08bfyqw19fd03ikaywkf2ngsl6hs34qvrrpci85";
    x86_64-linux = "0k7fsb9cfz2b3q7r5dk0cfyhwmavybs8kza0v8qyg2qijcv8xbfx";
    armv6l-linux = "0ndg4x8hp0hk806fzldmiy0hznmnv950v4bbrgqsw3hgp786s007";
    aarch64-linux = "1jh0i7zwh0lanyv7gkj5dmhx43lbygkb29d9lgl378hrkmgv115c";
    x86_64-darwin = "1znb8w8k8j2198chyzlgw0w036zmsdfvbk52lcgzsyvhcx181v3c";
    aarch64-darwin = "1znb8w8k8j2198chyzlgw0w036zmsdfvbk52lcgzsyvhcx181v3c";
  };

  urlMap = {
    i686-linux = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_linux_386.tar.gz";
    x86_64-linux = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_linux_amd64.tar.gz";
    armv6l-linux = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_linux_armv6.tar.gz";
    aarch64-linux = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_darwin_all.tar.gz";
    aarch64-darwin = "https://github.com/mcornick/clilol/releases/download/v1.0.23/clilol_1.0.23_darwin_all.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "clilol";
  version = "1.0.23";
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
    installShellCompletion ./completions/clilol.{bash,fish,zsh}
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
