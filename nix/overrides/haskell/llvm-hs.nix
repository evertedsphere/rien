{ mkDerivation, array, attoparsec, base, bytestring, Cabal
, containers, exceptions, fetchgit, llvm-hs-pure, mtl
, pretty-show, QuickCheck, stdenv, tasty, tasty-hunit
, tasty-quickcheck, template-haskell, temporary, transformers
, utf8-string, pkgs
}:
mkDerivation {
  pname = "llvm-hs";
  version = "5.1.3";
  src = fetchgit {
    url = "https://github.com/llvm-hs/llvm-hs";
    sha256 = "164w8r9f7v48ysdrklcxsrk8nivadkg9lslh7giik2k6zzk2581l";
    rev = "d80184eefe09d6a24df7c3268c53f279db00b44b";
  };
  postUnpack = "sourceRoot+=/llvm-hs; echo source root reset to $sourceRoot";
  setupHaskellDepends = [ base Cabal containers ];
  libraryHaskellDepends = [
    array attoparsec base bytestring containers exceptions llvm-hs-pure
    mtl template-haskell transformers utf8-string
  ];
  libraryToolDepends = [ pkgs.llvm_5 ];
  testHaskellDepends = [
    base bytestring containers llvm-hs-pure mtl pretty-show QuickCheck
    tasty tasty-hunit tasty-quickcheck temporary transformers
  ];
  homepage = "http://github.com/llvm-hs/llvm-hs/";
  description = "General purpose LLVM bindings";
  license = stdenv.lib.licenses.bsd3;
}
