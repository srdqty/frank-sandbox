let
  pkgs = import ./nix/nixpkgs-pinned {};
in
  pkgs.stdenv.mkDerivation {
    name = "frank-sandbox";

    buildInputs = [
      pkgs.ncurses # Needed by the bash-prompt.sh script
      pkgs.haskellPackages.frank
    ];

    shellHook = builtins.readFile ./nix/bash-prompt.sh + ''
      source ${pkgs.git.out}/etc/bash_completion.d/git-prompt.sh
      source ${pkgs.git.out}/etc/bash_completion.d/git-completion.bash
    '';
  }
