{ mkDerivation, aeson, attoparsec, base, beam-core, beam-migrate
, bytestring, dlist, fetchgit, free, hashable, mtl, network-uri
, scientific, sqlite-simple, stdenv, text, time
}:
mkDerivation {
  pname = "beam-sqlite";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/tathougies/beam";
    sha256 = "1g3kaz9z0mzjvanjvh5zvq6hr0qx7q2d24il7vrlqs8300q1rni5";
    rev = "1ff2f9a3fca1ec02fe3b86283171f414329b2f26";
  };
  postUnpack = "sourceRoot+=/beam-sqlite; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson attoparsec base beam-core beam-migrate bytestring dlist free
    hashable mtl network-uri scientific sqlite-simple text time
  ];
  homepage = "http://tathougies.github.io/beam/user-guide/backends/beam-sqlite/";
  description = "Beam driver for SQLite";
  license = stdenv.lib.licenses.bsd3;
}
