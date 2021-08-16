{ pkgs ? import sources."nixpkgs" { inherit system; config = {}; overlays = []; }
, system ? builtins.currentSystem
, sources ? import ./nix/sources.nix { inherit system; }

# Build an optimized release package.
# Currently requires dependents to use LTO. Use sparingly.
, release ? false
}:

let
  inherit (pkgs) callPackage;

  mavenix = import sources."mavenix" { inherit pkgs; };
  ttuegel = import sources."ttuegel" { inherit pkgs; };

  llvm-backend-project = import ./llvm-backend/src/main/native/llvm-backend {
    inherit pkgs;
    inherit release;
    src = ttuegel.cleanGitSubtree {
      name = "llvm-backend";
      src = ./.;
      subDir = "llvm-backend/src/main/native/llvm-backend";
    };
  };
  inherit (llvm-backend-project) clang llvm-backend;

  k = callPackage ./nix/k.nix {
    inherit haskell-backend llvm-backend mavenix prelude-kore;
    inherit (ttuegel) cleanGit cleanSourceWith;
  };

  haskell-backend-project = import ./haskell-backend/src/main/native/haskell-backend {
    inherit system; 
    src = ttuegel.cleanGitSubtree {
      src = ./.;
      subDir = "haskell-backend/src/main/native/haskell-backend";
    };
  };
  haskell-backend = haskell-backend-project.kore;
  inherit (haskell-backend-project) prelude-kore;

  self = {
    inherit k clang llvm-backend haskell-backend;
    inherit mavenix;
    inherit (pkgs) mkShell;
  };

in self

