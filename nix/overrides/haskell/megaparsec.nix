{ mkDerivation, base, bytestring, case-insensitive, containers
, criterion, deepseq, hspec, hspec-expectations, mtl
, parser-combinators, QuickCheck, scientific, stdenv, text
, transformers, weigh
}:
mkDerivation {
  pname = "megaparsec";
  version = "6.4.0";
  sha256 = "0h9azhs0dfrc359vrbd1jljrg3yfdbwd4p62cxqkn7mnh8913jpd";
  revision = "1";
  editedCabalFile = "1jzj3gb96skggngv69wibyx27bgng78dmlgv9i3lvz46z6bx8qzd";
  libraryHaskellDepends = [
    base bytestring case-insensitive containers deepseq mtl
    parser-combinators scientific text transformers
  ];
  testHaskellDepends = [
    base bytestring containers hspec hspec-expectations mtl QuickCheck
    scientific text transformers
  ];
  benchmarkHaskellDepends = [ base criterion deepseq text weigh ];
  homepage = "https://github.com/mrkkrp/megaparsec";
  description = "Monadic parser combinators";
  license = stdenv.lib.licenses.bsd2;
}
