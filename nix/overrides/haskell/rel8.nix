{ mkDerivation, adjunctions, aeson, base, bytestring, contravariant
, exceptions, fetchgit, free, lens, monad-control, mtl, one-liner
, opaleye, postgresql-simple, profunctors, resourcet, scientific
, stdenv, streaming, streaming-postgresql-simple, tagged, text
, time, transformers, uuid, vector
}:
mkDerivation {
  pname = "rel8";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/ocharles/rel8";
    sha256 = "0r1gj89lxzs3gm3xwzx0iha9y27v09yyh75k5v1s1svllaiybwxq";
    rev = "62a80a067378947265e9221e74de825ecf135e12";
  };
  libraryHaskellDepends = [
    adjunctions aeson base bytestring contravariant exceptions free
    lens monad-control mtl one-liner opaleye postgresql-simple
    profunctors resourcet scientific streaming
    streaming-postgresql-simple tagged text time transformers uuid
    vector
  ];
  testHaskellDepends = [ base ];
  description = "A type-safe, expressive and concise API for querying relational databases using Opaleye";
  license = stdenv.lib.licenses.bsd3;
}
