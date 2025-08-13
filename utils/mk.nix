{ lib, ... }:
{
  mkDefaultOption =
    enums:
    lib.mkOption {
      type = lib.types.enum (
        [ ] ++ lib.mapAttrsToList (n: v: n) (lib.attrsets.filterAttrs (n: v: n != "default") enums)
      );
    };
}
