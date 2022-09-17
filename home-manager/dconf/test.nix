{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkDictionaryEntry = lib.hm.gvariant.mkDictionaryEntry;
  mkEmptyArray = lib.hm.gvariant.mkEmptyArray;
  mkInt16 = lib.hm.gvariant.mkInt16;
  mkInt64 = lib.hm.gvariant.mkInt64;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkJust = lib.hm.gvariant.mkJust;
  mkNothing = lib.hm.gvariant.mkNothing;
  mkUchar = lib.hm.gvariant.mkUchar;
  mkUint16 = lib.hm.gvariant.mkUint16;
  mkUint32 = lib.hm.gvariant.mkUint32;
  mkUint64 = lib.hm.gvariant.mkUint64;
  mkVariant = lib.hm.gvariant.mkVariant;
  type = lib.hm.gvariant.type;
in {
  dconf.settings = {
    "test/gvariant" = {
      array-tuple = (mkTuple [["Array" "1"] ["Array" "2"][true true]]);
      bool = true;
      bool-array = [true false];
      double = 37.5;
      double-tuple = (mkTuple [1.0 2.0]);
      int16 = mkInt16 16;
      int16-array-empty = (mkEmptyArray type.int16); #if you want an empty array
      int32 = 32;
      int64 = mkInt64 64;
      long-tuple = (mkTuple ["String" (mkUchar 255) (mkInt16 16)]);
      mixed-tuple = (mkTuple [true "This is a string"]);
      string = "string";
      string-array = ["String" "String"]; #unlike tuples, arrays can't have multiple types
      string-array-empty = []; #this is read as a string by default
      string-array-with-maybe = [(mkJust "String") (mkNothing type.string)];
      string-tuple = (mkTuple ["First element" "Second element"]);
      tuple-array = [(mkTuple ["12" false]) (mkTuple ["String" true])]; #as this is an array, tuples have to have the same types
      tuple-tuple = (mkTuple [false (mkTuple ["This is an embedded tuple" true])]);
      variant-array = [(mkVariant "String") (mkVariant 10)]; #Variants are used to disrupt type referencing. This should parse with no errors
      variant-string = (mkVariant "String");
      uchar = mkUchar 1; # value from 0 to 255
      uint16 = mkUint16 16;
      uint32 = mkUint32 32;
      uint64 = mkUint64 64;
    };
    "test/variant" = {
      legal-array = [[""] (mkEmptyArray type.string)]; #parses
      illegal-array = [(mkVariant [""]) (mkVariant (mkEmptyArray type.string))]; #parses as nix requires empty arrays to be explicitly declared
      variant-array = [(mkVariant ["Test" "123"]) (mkVariant 123)];
    };
    "test/dictionary" = {
      dictionary = [(mkDictionaryEntry ["One" (mkVariant (mkUint32 1))]) (mkDictionaryEntry ["Two" (mkVariant "dos")])];
      dictEntry = (mkDictionaryEntry [1 ["foo"]]);
      dictionaryOfDictionaries = [
        (mkDictionaryEntry ["Vortaro Unu" (mkVariant [
          (mkDictionaryEntry ["Esperanto" 1])
	  (mkDictionaryEntry ["Ido" 2])
	])])
	(mkDictionaryEntry ["English One" (mkVariant [
	  (mkDictionaryEntry ["English" 1])
	])])
      ];
    };
  };
}
