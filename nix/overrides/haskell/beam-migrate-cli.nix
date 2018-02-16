{ mkDerivation, aeson, ansi-terminal, base, beam-core, beam-migrate
, bytestring, containers, cryptonite, directory, fetchgit, fgl
, filepath, hashable, haskell-src-exts, hint, largeword, mtl
, network, optparse-applicative, random, stdenv, text, time, unix
, unordered-containers, uuid, yaml
}:
mkDerivation {
  pname = "beam-migrate-cli";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/tathougies/beam";
    sha256 = "1g3kaz9z0mzjvanjvh5zvq6hr0qx7q2d24il7vrlqs8300q1rni5";
    rev = "1ff2f9a3fca1ec02fe3b86283171f414329b2f26";
  };
  postUnpack = "sourceRoot+=/beam-migrate-cli; echo source root reset to $sourceRoot";
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson ansi-terminal base beam-core beam-migrate bytestring
    containers cryptonite directory fgl filepath hashable
    haskell-src-exts hint largeword mtl network optparse-applicative
    random text time unix unordered-containers uuid yaml
  ];
  homepage = "https://travis.athougies.net/projects/beam.html";
  description = "CLI tool for beam-migrate";
  license = stdenv.lib.licenses.mit;
}
