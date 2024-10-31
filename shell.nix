with import <nixpkgs> {};
  mkShellNoCC {
    packages = [
      julia
    ];
  }
