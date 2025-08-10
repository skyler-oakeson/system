{ inputs }:
{
  nvim-neopywal = import ./nvim-neopywal.nix { inherit inputs; };
  nvim-blink = import ./nvim-blink.nix { inherit inputs; };
}
