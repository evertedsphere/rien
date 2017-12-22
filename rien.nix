{ packageName
, packagePath
, nixpkgsLock
, ghcVersion
, overrides ? {}
, haskellOverridePath ? ./nix/overrides/haskell
}:

let
  haskellPath = ./haskell.nix;

  haskellPackageSets = { 
    skipTests = (overrides.skipTests or []) ++
      [ 
        "coxswain"
        "monad-memo"
        "ghc-exactprint"
        "rdf4h" 
        "hsparql"
      ];
    jailbreak = (overrides.jailbreak or []) ++
      [ "machines-process" 
        "brittany" # butcher-1.2, not <1.2
        "hakyll"
        "latex-formulae-image"
        # "latex-formulae-pandoc"
        # "latex-formulae-hakyll"
      ];
    skipHaddock = (overrides.skipHaddock or []) ++ 
      [ 
      ];

    justStaticExecutables = (overrides.justStaticExecutables or []) ++ [];

    manualOverrides = hsNew: hsOld:  {

    };
  };

  haskellConfig = { 
    compiler = ghcVersion;
    inherit haskellPackageSets haskellOverridePath;
  };

  haskellLib = import haskellPath haskellConfig; 

  nixpkgsConf = builtins.fromJSON (builtins.readFile nixpkgsLock);

  src = 
    let 
      bootstrap = import <nixpkgs> { }; 
    in bootstrap.fetchFromGitHub {
        owner = "NixOS";
        repo  = "nixpkgs";
        inherit (nixpkgsConf) rev sha256;
    };

  nixpkgsAttrs = { 
    allowUnfree = true;
    inherit (haskellLib) packageOverrides;
  };

  pkgs = import src { config = nixpkgsAttrs; };

  haskellPackages = pkgs.haskell.packages.${ghcVersion};

  ## ---------------------------------------------------------------------------
  ## -- Shell environment

  haskellEnv = {extraPackages, wantHoogle}: haskellLib.makeEnv wantHoogle pkgs
    (hp: with hp; (extraPackages hp) ++ [
      ghc 
      cabal-install
      # cabal2nix 
    ]);

  shell = {deps ? (_: []), depSets ? (_ : []), nativeDeps ? (_: []), wantHoogle ? false}: let
    pkgInputs = nativeDeps pkgs;
    haskellEnvInput = haskellEnv { 
      inherit wantHoogle; 
      extraPackages = hp: (deps hp) ++ pkgs.lib.concatLists (depSets hp); 
    };
    myInputs = [ haskellEnvInput ];

  in pkgs.stdenv.mkDerivation { 
    name = "${packageName}-rien-env";
    src  = packagePath;
    buildInputs = pkgInputs ++ myInputs;
  };

  ## ---------------------------------------------------------------------------
  ## -- Main export for release.nix

  self = rec { 
    inherit shell pkgs haskellPackages;
    package-sets = import ./package-sets.nix;
  };

in self
