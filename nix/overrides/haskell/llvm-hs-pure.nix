{ mkDerivation, attoparsec, base, bytestring, containers, fail
, fetchgit, hspec, mtl, stdenv, tasty, tasty-hunit
, tasty-quickcheck, template-haskell, text, transformers
, unordered-containers
}:
mkDerivation {
  pname = "llvm-hs-pure";
  version = "5.1.2";
  src = fetchgit {
    url = "https://github.com/llvm-hs/llvm-hs";
    sha256 = "164w8r9f7v48ysdrklcxsrk8nivadkg9lslh7giik2k6zzk2581l";
    rev = "d80184eefe09d6a24df7c3268c53f279db00b44b";
  };
  postUnpack = "sourceRoot+=/llvm-hs-pure; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    attoparsec base bytestring containers fail mtl template-haskell
    transformers unordered-containers
  ];
  testHaskellDepends = [
    base bytestring containers hspec mtl tasty tasty-hunit
    tasty-quickcheck text transformers unordered-containers
  ];
  homepage = "http://github.com/llvm-hs/llvm-hs/";
  description = "Pure Haskell LLVM functionality (no FFI)";
  license = stdenv.lib.licenses.bsd3;
}
