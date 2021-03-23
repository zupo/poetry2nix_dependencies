let
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/a322b32e9d74fb476944ff6cfb55833dc69cfaaa.tar.gz";
    sha256 = "1r0mkiqxija75spnyksmh8x5j4smnrxv5f7768s81gsl570kls0l";
  };
  pkgs = import nixpkgs {};

  myAppEnv = pkgs.poetry2nix.mkPoetryEnv {
    projectDir = ./.;
    editablePackageSources = {
      my-app = ./src;
    };
  };

in

pkgs.mkShell {
  buildInputs = [
    # myAppEnv
    pkgs.poetry
  ];

}
