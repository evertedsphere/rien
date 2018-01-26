{ mkDerivation, base, bytestring, encode-string, fetchgit
, llvm-hs-pure, stdenv
}:
mkDerivation {
  pname = "llvm-hs-typed";
  version = "5.0.0.0";
  src = fetchgit {
    url = "https://github.com/llvm-hs/llvm-hs-typed";
    sha256 = "0xk9zf632q8jf9gcwa7xxp30msrx6rkmghbv2ha0x02yk7h5hbbj";
    rev = "39291c2e956e0755d837054752c7cd086dc0aba3";
  };
  libraryHaskellDepends = [
    base bytestring encode-string llvm-hs-pure
  ];
  homepage = "https://github.com/llvm-hs/llvm-hs-typed";
  description = "LLVM AST with type-level tracking of LLVM types";
  license = stdenv.lib.licenses.bsd3;
}
