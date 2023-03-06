import 'package:gc_wizard/tools/science_and_technology/numeral_bases/logic/numeral_bases.dart';
import 'package:gc_wizard/utils/collection_utils.dart';

final Map<String, String> halfByteToDuck = {
  '0': 'Nak',
  '1': 'Nanak',
  '2': 'Nananak',
  '3': 'Nanananak',
  '4': 'Nak?',
  '5': 'nak?',
  '6': 'Naknak',
  '7': 'Naknaknak',
  '8': 'Nak.',
  '9': 'Naknak.',
  '10': 'Naknaknaknak',
  '11': 'nanak',
  '12': 'naknak',
  '13': 'nak!',
  '14': 'nak.',
  '15': 'naknaknak',
};
final Map<String, String> duckToHalfByte = switchMapKeyValue(halfByteToDuck);

String encodeDuckSpeak(String? text) {
  if (text == null || text.isEmpty) return '';

  var out = <String>[];
  for (var ascii in text.codeUnits) {
    var binary = ascii.toRadixString(2).padLeft(8, '0');
    out.add(halfByteToDuck[convertBase(binary.substring(0, 4), 2, 10)] ?? '');
    out.add(halfByteToDuck[convertBase(binary.substring(4, 8), 2, 10)] ?? '');
  }
  return out.join(' ');
}

String decodeDuckSpeak(String? text) {
  if (text == null || text.isEmpty) return '';

  var decimal = <int>[];
  text.split(RegExp(r'\s+')).forEach((nak) {

    var value = duckToHalfByte[nak];
    if (value != null) {
      var valueInt = int.tryParse(value);
      if (valueInt != null) decimal.add(valueInt);
    }
  });
  var binary = <String>[];
  for (var i = 0, j = decimal.length; i < j - j % 2; i = i + 2) {
    binary.add(decimal[i].toRadixString(2) + decimal[i + 1].toRadixString(2).padLeft(4, '0'));
  }
  var out = '';
  for (var binaryVal in binary) {
    var ascii = int.tryParse(convertBase(binaryVal, 2, 10));
    if (ascii != null) {
      out += (String.fromCharCode(ascii));
    }
  }
  return out.replaceAll(RegExp(r'[\x00-\x0F]'), '');
}

String encodeDuckSpeakNumbers(List<int>? numbers) {
  if (numbers == null) return '';

  return numbers.map((number) => halfByteToDuck[number.toString()]).join(' ');
}

List<int> decodeDuckSpeakNumbers(String? text) {
  if (text == null) return [];

  return text
      .split(RegExp(r'\s+'))
      .map((code) {
        var number = duckToHalfByte[code];
        if (number == null) return null;
        return int.tryParse(number);
      })
      .where((number) => number != null)
      .cast<int>()
      .toList();
}
