{ mkDerivation, aeson, base, bytestring, containers, dlist
, fetchgit, free, ghc-prim, hashable, microlens, mtl, network-uri
, stdenv, tasty, tasty-hunit, text, time, vector-sized
}:
mkDerivation {
  pname = "beam-core";
  version = "0.6.0.0";
  src = fetchgit {
    url = "https://github.com/tathougies/beam";
    sha256 = "1g3kaz9z0mzjvanjvh5zvq6hr0qx7q2d24il7vrlqs8300q1rni5";
    rev = "1ff2f9a3fca1ec02fe3b86283171f414329b2f26";
  };
  postUnpack = "sourceRoot+=/beam-core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base bytestring containers dlist free ghc-prim hashable
    microlens mtl network-uri text time vector-sized
  ];
  testHaskellDepends = [
    base bytestring tasty tasty-hunit text time
  ];
  homepage = "http://travis.athougies.net/projects/beam.html";
  description = "Type-safe, feature-complete SQL query and manipulation interface for Haskell";
  license = stdenv.lib.licenses.mit;
}
