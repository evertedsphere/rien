{ haskellOverridePath, haskellPackageSets, compiler }:

let release = rec { 
  makeEnv = wantHoogle: super: k:
    let self = super.pkgs;
        ghc = self.haskell.packages."${compiler}";
    in (if wantHoogle then ghc.ghcWithHoogle else ghc.ghcWithPackages) k;

  packageOverrides = pkgs: rec {
    haskell = pkgs.haskell // {
      packages = pkgs.haskell.packages // {
        ${compiler} =
           let
             generatedOverrides = hsNew: hsOld:
               let
                 toPackage = file: _: {
                   name  = builtins.replaceStrings [ ".nix" ] [ "" ] file;
                   value = hsNew.callPackage (haskellOverridePath + "/${file}") { };
                 };
               in pkgs.lib.mapAttrs' toPackage (builtins.readDir haskellOverridePath);

             makeOverrides = fn: names: hsNew: hsOld:
               let 
                 toPackage = name: {
                   inherit name;
                   value = fn hsOld.${name};
                 };
               in builtins.listToAttrs (map toPackage names);

             composeExtensionsList =
               pkgs.lib.fold pkgs.lib.composeExtensions (_: _: {});

           in
             pkgs.haskell.packages.${compiler}.override {
               overrides = composeExtensionsList [
                 generatedOverrides
                 (makeOverrides pkgs.haskell.lib.dontCheck   haskellPackageSets.skipTests)
                 (makeOverrides pkgs.haskell.lib.doJailbreak haskellPackageSets.jailbreak)
                 (makeOverrides pkgs.haskell.lib.dontHaddock haskellPackageSets.skipHaddock)
                 (makeOverrides pkgs.haskell.lib.justStaticExecutables haskellPackageSets.justStaticExecutables)
                 haskellPackageSets.manualOverrides
               ];
            };
      };
    };
  };
};

in release
