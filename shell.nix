{ compiler ? import ./nix/ghc.nix }:

let
  pkgs = import ./nix/nixpkgs-pinned {};

  haskellPackages = pkgs.haskell.packages."${compiler}".override {
    overrides = new: old: {
      frank = old.callPackage ./nix/pkgs/frank {};
    };
  };
in
  pkgs.stdenv.mkDerivation {
    name = "frank-practice";

    buildInputs = [
      pkgs.git
      pkgs.vim
      pkgs.ncurses # Needed by the bash-prompt.sh script
      haskellPackages.frank
    ];

    shellHook = builtins.readFile ./nix/bash-prompt.sh + ''
      source ${pkgs.git.out}/etc/bash_completion.d/git-prompt.sh
      source ${pkgs.git.out}/etc/bash_completion.d/git-completion.bash
    '';
  }
