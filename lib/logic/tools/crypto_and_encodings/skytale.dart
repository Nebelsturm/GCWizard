import 'package:gc_wizard/logic/tools/crypto_and_encodings/transposition.dart';

String encryptSkytale(String input, {int countRows, int countColumns, int countLettersPerCell: 1}) {
  return encryptTransposition(input, countRows: countRows, countColumns: countColumns, countLettersPerCell: countLettersPerCell);
}

String decryptSkytale(String input, {int countRows, int countColumns, int countLettersPerCell: 1}) {
  return decryptTransposition(input, countRows: countRows, countColumns: countColumns, countLettersPerCell: countLettersPerCell);
}