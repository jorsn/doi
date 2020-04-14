{ pkgs ? import <nixpkgs> {}
, haskellCompiler ? "ghc865"
}:

let
  hpkgs = pkgs.haskell.packages.${haskellCompiler};
in hpkgs.developPackage {
  name = "doi";
  root = pkgs.lib.sourceFilesBySuffices ./. [ ".nix" ".cabal" ".hs" ".bib" ];
  modifier = drv: drv // {
    env = hpkgs.shellFor {
      packages = hpkgs: [ drv ];
      withHoogle = true;
    };
  };
}
