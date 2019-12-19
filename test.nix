{ ref ? "master" }:

with import <nixpkgs> {
  overlays = [
    (import (builtins.fetchGit { url = "git@gitlab.intr:_ci/nixpkgs.git"; inherit ref; }))
  ];
};

maketestPhp {
  php = php74;
  image = callPackage ./default.nix { inherit ref; };
  rootfs = ./rootfs;
}{}
