with import <nixpkgs> {
  overlays = [
    (import (builtins.fetchGit { url = "git@gitlab.intr:_ci/nixpkgs.git"; ref = "master"; }))
  ];
};

maketestPhp {
  php = php.php74;
  image = callPackage ./default.nix {};
  rootfs = ./rootfs;
}
