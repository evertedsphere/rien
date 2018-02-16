{ mkDerivation, base, bifunctors, criterion, deepseq, directory
, hmatrix, lens, microlens, mnist-idx, mwc-random, primitive
, reflection, stdenv, time, transformers, type-combinators, vector
}:
mkDerivation {
  pname = "backprop";
  version = "0.1.3.0";
  sha256 = "3cc02acab2c661cb2dcc749e184ee9378b4366f20e60c557c0b401da10b93b74";
  libraryHaskellDepends = [
    base deepseq microlens primitive reflection transformers
    type-combinators vector
  ];
  benchmarkHaskellDepends = [
    base bifunctors criterion deepseq directory hmatrix lens mnist-idx
    mwc-random time transformers vector
  ];
  homepage = "https://github.com/mstksg/backprop#readme";
  description = "Heterogeneous automatic differentation (backpropagation)";
  license = stdenv.lib.licenses.bsd3;
}
