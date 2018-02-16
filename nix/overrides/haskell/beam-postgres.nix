{ mkDerivation, aeson, base, beam-core, beam-migrate, bytestring
, case-insensitive, conduit, fetchgit, free, hashable
, haskell-src-exts, mtl, network-uri, postgresql-libpq
, postgresql-simple, scientific, stdenv, text, time
, unordered-containers, uuid, vector
}:
mkDerivation {
  pname = "beam-postgres";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/tathougies/beam";
    sha256 = "1g3kaz9z0mzjvanjvh5zvq6hr0qx7q2d24il7vrlqs8300q1rni5";
    rev = "1ff2f9a3fca1ec02fe3b86283171f414329b2f26";
  };
  postUnpack = "sourceRoot+=/beam-postgres; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base beam-core beam-migrate bytestring case-insensitive
    conduit free hashable haskell-src-exts mtl network-uri
    postgresql-libpq postgresql-simple scientific text time
    unordered-containers uuid vector
  ];
  homepage = "http://travis.athougies.net/projects/beam.html";
  description = "Connection layer between beam and postgres";
  license = stdenv.lib.licenses.mit;
}
