{ pkgs ? import <nixpkgs> { }, path, ... }:
let
  lib = pkgs.lib;
  stdenv = pkgs.stdenv;
  scheme = import ./generate.nix { inherit path pkgs lib stdenv; };
in 
{ inherit scheme; }
