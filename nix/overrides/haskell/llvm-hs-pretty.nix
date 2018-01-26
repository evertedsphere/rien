{ mkDerivation, array, base, bytestring, directory, fetchgit
, filepath, llvm-hs, llvm-hs-pure, mtl, pretty-show, stdenv, tasty
, tasty-golden, tasty-hspec, tasty-hunit, text, transformers
, wl-pprint-text
}:
mkDerivation {
  pname = "llvm-hs-pretty";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/llvm-hs/llvm-hs-pretty";
    sha256 = "0gdbi4s28zibzy6393i77qskkzn47lyqbsy1bpr9hpssb72hw9im";
    rev = "7cb677e6609365b154129cb1193c58886ecec309";
  };
  libraryHaskellDepends = [
    array base bytestring llvm-hs-pure text wl-pprint-text
  ];
  testHaskellDepends = [
    base directory filepath llvm-hs llvm-hs-pure mtl pretty-show tasty
    tasty-golden tasty-hspec tasty-hunit text transformers
  ];
  homepage = "https://github.com/llvm-hs/llvm-hs-pretty";
  description = "Pretty printer for LLVM IR";
  license = stdenv.lib.licenses.mit;
}
