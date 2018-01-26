{ mkDerivation, alex, array, base, bytestring, containers, fetchgit
, happy, haskell-src-meta, llvm-hs-pure, mainland-pretty, mtl
, split, srcloc, stdenv, syb, symbol, tasty, tasty-hunit
, template-haskell, th-lift, th-lift-instances
}:
mkDerivation {
  pname = "llvm-hs-quote";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/llvm-hs/llvm-hs-quote";
    sha256 = "10lixz1a9kg2ngc17693mx1q3xpv4lrd3kqb127r6m4049z2l10f";
    rev = "d8cc1d824d0af16694894745cf815609fa90f67d";
  };
  libraryHaskellDepends = [
    array base bytestring containers haskell-src-meta llvm-hs-pure
    mainland-pretty mtl split srcloc syb symbol template-haskell
    th-lift th-lift-instances
  ];
  libraryToolDepends = [ alex happy ];
  testHaskellDepends = [
    base bytestring containers llvm-hs-pure tasty tasty-hunit
  ];
  homepage = "https://github.com/llvm-hs/llvm-hs-quote";
  description = "QuasiQuoting llvm code for llvm-hs";
  license = stdenv.lib.licenses.bsd3;
}
