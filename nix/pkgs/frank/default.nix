{ mkDerivation, base, bytestring, cmdargs, containers, directory
, fetchgit, indentation-trifecta, mtl, parsers, pretty, stdenv
, tasty, tasty-hunit, text, transformers, trifecta, Unique
, unordered-containers, wl-pprint
}:
mkDerivation {
  pname = "frank";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/frank-lang/frank";
    sha256 = "0mkh8py0clnk2ffdxqh5q2gzyybg793yaz4p2j83yyhsspnaaxl5";
    rev = "871259c1bc792fa6d68d294db48a8ab1a4e0cada";
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring cmdargs containers directory indentation-trifecta
    mtl parsers pretty tasty tasty-hunit text transformers trifecta
    Unique unordered-containers wl-pprint
  ];
  homepage = "https://github.com/cmcl/frankjnr";
  description = "Frank programming language";
  license = { fullName = "unknown"; shortName = "unknown"; };
  hydraPlatforms = stdenv.lib.platforms.none;
}
