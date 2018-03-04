{ mkDerivation, base, foldl, hspec, lucid, microlens, mmark
, modern-uri, skylighting, stdenv, text
}:
mkDerivation {
  pname = "mmark-ext";
  version = "0.2.0.0";
  sha256 = "33c887800c99db79747a79f66987919f0407453e01a75baae8007d64b56c8eb1";
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    base foldl lucid microlens mmark modern-uri skylighting text
  ];
  testHaskellDepends = [ base hspec lucid mmark text ];
  homepage = "https://github.com/mmark-md/mmark-ext";
  description = "Commonly useful extensions for MMark markdown processor";
  license = stdenv.lib.licenses.bsd3;
}
