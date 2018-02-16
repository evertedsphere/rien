{ mkDerivation, aeson, base, beam-core, bytestring, containers
, deepseq, dependent-map, dependent-sum, fetchgit, free, ghc-prim
, hashable, haskell-src-exts, mtl, parallel, pqueue, pretty
, scientific, stdenv, text, time, unordered-containers, vector
}:
mkDerivation {
  pname = "beam-migrate";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/tathougies/beam";
    sha256 = "1g3kaz9z0mzjvanjvh5zvq6hr0qx7q2d24il7vrlqs8300q1rni5";
    rev = "1ff2f9a3fca1ec02fe3b86283171f414329b2f26";
  };
  postUnpack = "sourceRoot+=/beam-migrate; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base beam-core bytestring containers deepseq dependent-map
    dependent-sum free ghc-prim hashable haskell-src-exts mtl parallel
    pqueue pretty scientific text time unordered-containers vector
  ];
  homepage = "https://travis.athougies.net/projects/beam.html";
  description = "SQL DDL support and migrations support library for Beam";
  license = stdenv.lib.licenses.mit;
}
