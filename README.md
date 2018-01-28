## `rien = predictable (haskell + cabal + nix)`

* create and work with Cabal-based Haskell development environments using Nix 
* use locally installed versions of development tools like `ghc-mod` etc

Eventually intended to be a good Stack replacement.

This is not even in alpha yet.

## Example: create a new project

```shell
# Create the directory and initialize a Git repo:
mkdir foo && cd foo && git init

# Add `rien` as a submodule to your Git repo:
git submodule add https://github.com/mrkgnao/rien .rien/

# Create a nixpkgs lock-file:
nix-prefetch-git https://github.com/NixOS/nixpkgs.git > nixpkgs.json

# Create a shell.nix and modify according to taste:
cp .rien/shell.template.nix shell.nix

# Enter a Nix shell with Cabal and ghc installed:
nix-shell

# Now we create a Cabal project and build it.
cabal init
cabal build
```

You can then run the application (if you built an `executable`):

```
$ cabal run foo
Hello, Haskell!
```

## Example setup

```nix
let 
  rien = import .rien/rien.nix {
    packageName = "hello-world";
    packagePath = ./.;

    # Instead of using <nixpkgs>, use a lock-file to stick to
    # a particular `nixpkgs` commit.
    nixpkgsLock = ./nixpkgs.json;

    ghcVersion = "ghc822";

    overrides = {
      # I don't want to use Brittany as a library!
      justStaticExecutables = [ "brittany" ];
    };
  };

in
  rien.shell {
    # Generate Hoogle documentation?
    wantHoogle = true;

    # Haskell dependencies
    deps = hsPkgs: with hsPkgs; [
      brittany
    ];

    # Optionally, also add sets of related packages that are
    # commonly used together.
    depSets = hsPkgs: with (rien.package-sets hsPkgs); [
      trifectaFull
      conduitFull
      pretty-printing
    ];

    # Native dependencies
    nativeDeps = pkgs: with pkgs; [
      z3
      llvm
    ];
  }
```

## Credits

Lots of code is from [haskell-nix](https://github.com/Gabriel439/haskell-nix)
and [clash-playground](https://github.com/thoughtpolice/clash-playground).
