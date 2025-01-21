{ pkgs ? import <nixpkgs> { }, path, ... }:
let
stdenv = pkgs.stdenv;
generated = stdenv.mkDerivation  {
  name = "generated-colors";
  env = {
    HOME = "./";
  };
  unpackPhase = "true";
  nativeBuildInputs = with pkgs; [ wallust ];
  buildPhase = ''
    wallust run ${path}
    json=*.json
    files=(.cache/wallust/$json)
  '';
  postInstall = 
  let 
    cache = "$out/.cache/wallust";
  in
  ''
    mkdir $out
    cp -vr --no-preserve=mode . $out
    cp -v ${cache}/*.json $out/color-scheme.json
  '';
};
in
builtins.fromJSON (builtins.readFile "${builtins.toString generated}/color-scheme.json")

