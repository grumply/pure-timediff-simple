{ mkDerivation, base, pure, pure-default, pure-json, stdenv }:
mkDerivation {
  pname = "pure-timediff-simple";
  version = "0.7.0.0";
  src = ./.;
  libraryHaskellDepends = [ base pure pure-default pure-json ];
  homepage = "github.com/grumply/pure-timediff-simple";
  license = stdenv.lib.licenses.bsd3;
}