import "package:flutter_test/flutter_test.dart";
import 'package:gc_wizard/utils/crosstotals.dart';

void main() {
  group("Crosstotals.sum:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,3,1,1,1,100], 'expectedOutput' : 109},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 1, null], 'expectedOutput' : 1},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -31},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sum(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.product:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,3,1,1,1,100], 'expectedOutput' : 600},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 1, null], 'expectedOutput' : 1},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 961129483776},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -200},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = product(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossSum:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 13},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 18},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -4},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossSum(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossProduct:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 0},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 216},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : 0},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossProduct(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossSumIterated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 4},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 9},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 2},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -4},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossSumIterated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossProductIterated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 0},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 2},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 0},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : 0},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossProductIterated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossSumAlternatedForward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : -1},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 6},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : -4},
      {'list' : [191,9191,9,19,1919], 'expectedOutput' : -56},
      {'list' : [91,9191,9,19,19191], 'expectedOutput' : 56},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossSumAlternatedForward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossSumAlternatedBackward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 1},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 6},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 4},
      {'list' : [191,9191,9,19,1919], 'expectedOutput' : 56},
      {'list' : [91,9191,9,19,19191], 'expectedOutput' : -56},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossSumAlternatedBackward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.crossProductAlternated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 0},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : -216},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : -627056640},
      {'list' : [191,9191,9,19,1919], 'expectedOutput' : -4782969},
      {'list' : [91,9191,9,19,19191], 'expectedOutput' : -4782969},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = crossProductAlternated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumAlternatedBackward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 131},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 666},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : -1249},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 7092},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : -10072},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -11},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumAlternatedBackward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumAlternatedForward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 131},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 666},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : -1249},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : -7092},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 10072},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -11},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumAlternatedForward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.productAlternated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : -6600},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 666},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 961129483776},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : -576059334669},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : -24702470179569},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : 200},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = productAlternated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumCrossSum:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 13},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 18},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 11},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 8},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 16},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -4},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumCrossSum(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.productCrossSum:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 12},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 18},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 63},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 63},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 63},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -2},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = productCrossSum(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumCrossSumIterated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 4},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 9},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 2},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 8},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 7},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -4},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumCrossSumIterated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.productCrossSumIterated:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 3},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 9},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 9},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 9},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 9},
      {'list' : [1, 0, -1], 'expectedOutput' : 0},
      {'list' : [-20, -10, -1], 'expectedOutput' : -2},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = productCrossSumIterated(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumCrossSumAlternatedForward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 7},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 6},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 3},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 0},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : -2},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumCrossSumAlternatedForward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.sumCrossSumAlternatedBackward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 7},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 6},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : 3},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : 0},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : -2},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = sumCrossSumAlternatedBackward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.productCrossSumAlternatedForward:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [1,2,33,1,1,1,100], 'expectedOutput' : 0},
      {'list' : [].cast<int>(), 'expectedOutput' : 0},
      {'list' : [null].cast<int>(), 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
      {'list' : [null, 666, null], 'expectedOutput' : 6},
      {'list' : [891,589,1,2336,784], 'expectedOutput' : -11},
      {'list' : [191,9191,9,19,1919,1], 'expectedOutput' : -5},
      {'list' : [91,9191,9,19,19191,9], 'expectedOutput' : 5},
      {'list' : [1, 0, -1], 'expectedOutput' : null},
      {'list' : [-20, -10, -1], 'expectedOutput' : null},
    ];

    _inputsToExpected.forEach((elem) {
      test('list: ${elem['list']}', () {
        var _actual = productCrossSumAlternatedForward(elem['list']);
        expect(_actual.toString(), elem['expectedOutput'].toString());
      });
    });
  });

  group("Crosstotals.countCharacters:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'list' : [-20, -10, -1, 891, 589, 1, 2, 336, 784], 'expectedOutput' : 9},
      {'list' : '', 'expectedOutput' : 0},
      {'list' : null, 'expectedOutput' : 0},
    ];

    _inputsToExpected.forEach((elem) {
      test('text: ${elem['text']}', () {
        var _actual = countCharacters(elem['list']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("Crosstotals.countLetters:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'text' : ' zIo120/k Da.ßÀöẞ? ', 'expectedOutput' : 10},
      {'text' : '', 'expectedOutput' : 0},
      {'text' : null, 'expectedOutput' : 0},
    ];

    _inputsToExpected.forEach((elem) {
      test('text: ${elem['text']}', () {
        var _actual = countLetters(elem['text']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("Crosstotals.countDigits:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'text' : ' zIo120/k Da.ßÀö? ', 'expectedOutput' : 3},
      {'text' : '', 'expectedOutput' : 0},
      {'text' : null, 'expectedOutput' : 0},
    ];

    _inputsToExpected.forEach((elem) {
      test('text: ${elem['text']}', () {
        var _actual = countDigits(elem['text']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });
}
