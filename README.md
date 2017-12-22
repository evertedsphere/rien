## `rien = predictably (haskell + cabal + nix)`

This is not even in alpha yet.

### Example: create a new project

```shell
$ mkdir foo
$ cd foo
```

Create a nixpkgs lock-file:

``` shell
$ nix-prefetch-git https://github.com/NixOS/nixpkgs.git > nixpkgs.json
```

```shell
$ cp $PATH_TO_RIEN/shell.template.nix shell.nix
```
Correct the path to the rien.nix file in the shell.nix you just created.
Modify otherwise according to taste, adding your favorite development
tools (`ghcid`, `hlint`, etc.) or any dependencies you will need.

Now we create a Cabal project:

```shell
$ cabal init

  # ... go through the prompts ...
  
$ cabal build
$ cabal run foo
Hello, Haskell!
```

### Example shell.nix

```nix
let 
  rien = import /home/exampleuser/repos/rien/rien.nix {
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

### Credits

Lots of code is from [haskell-nix](https://github.com/Gabriel439/haskell-nix)
and [clash-playground](https://github.com/thoughtpolice/clash-playground).
