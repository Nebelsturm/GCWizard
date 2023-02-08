import "package:flutter_test/flutter_test.dart";
import 'package:gc_wizard/utils/data_type_utils/double_type_utils.dart';

void main() {
  group("DoubleTypeUtils.doubleEquals:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'a' : null, 'b': null, 'tolerance': 1e-10, 'expectedOutput' : true},
      {'a' : null, 'b': 1.0, 'tolerance': 1e-10, 'expectedOutput' : false},
      {'a' : 1.0, 'b': null, 'tolerance': 1e-10, 'expectedOutput' : false},

      {'a' : 1.0, 'b': 1.0, 'tolerance': 1e-10, 'expectedOutput' : true},
      {'a' : 1.123, 'b': 1.123, 'tolerance': 1e-10, 'expectedOutput' : true},
      {'a' : 52.1231554889286231, 'b': 52.1231554889286231, 'tolerance': 1e-10, 'expectedOutput' : true},
      {'a' : 52.123, 'b': 52.132, 'tolerance': 1e-2, 'expectedOutput' : true},
      {'a' : 52.123, 'b': 52.133, 'tolerance': 1e-2, 'expectedOutput' : false},
    ];

    _inputsToExpected.forEach((elem) {
      test('a: ${elem['a']}, b: ${elem['b']}, tolerance: ${elem['tolerance']}', () {
        var _actual = doubleEquals(elem['a'], elem['b'], tolerance: elem['tolerance']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("DoubleTypeUtils.separateDecimalPlaces:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'input' : null, 'expectedOutput' : null},

      {'input' : 0.0, 'expectedOutput' : 0},
      {'input' : 1.2, 'expectedOutput' : 2},
      {'input' : .2, 'expectedOutput' : 2},
      {'input' : 1.0, 'expectedOutput' : 0},
      {'input' : 123.4, 'expectedOutput' : 4},
      {'input' : 12.345, 'expectedOutput' : 345},
    ];

    _inputsToExpected.forEach((elem) {
      test('input: ${elem['input']}', () {
        var _actual = fractionPartAsInteger(elem['input']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });
}