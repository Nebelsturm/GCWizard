import 'dart:math';

import "package:flutter_test/flutter_test.dart";
import 'package:gc_wizard/logic/tools/formula_solver/parser.dart';
import 'package:gc_wizard/persistence/formula_solver/model.dart';

void main() {
  group("FormulaParser.parse:", () {
    Map<String, String> values = {
      'A':'3', 'B':'20', 'C': '100', 'D': '5', 'E': 'Pi', 'F': '2 - 1', 'G': 'B - A + 1',
      'Q': '1', 'R': '0', 'S': '200', 'T': '20', 'U': '12', 'V': '9', 'W': '4', 'X': '30', 'Y':'4', 'Z': '50'
    };

    List<Map<String, dynamic>> _inputsToExpected = [
      {'formula' : null, 'values': null, 'expectedOutput' : {'state': 'error', 'output': [{'result': null, 'state': 'error'}]}},
      {'formula' : null, 'values': <String, String>{}, 'expectedOutput' : {'state': 'error', 'output': [{'result': null, 'state': 'error'}]}},
      {'formula' : null, 'expectedOutput' : {'state': 'error', 'output': [{'result': null, 'state': 'error'}]}},
      {'formula' : '', 'expectedOutput' : {'state': 'error', 'output': [{'result': '', 'state': 'error'}]}},
      {'formula' : ' ', 'expectedOutput' : {'state': 'error', 'output': [{'result': '', 'state': 'error'}]}},
      {'formula' : 'A', 'values': null, 'expectedOutput' : {'state': 'error', 'output': [{'result': 'A', 'state': 'error'}]}},
      {'formula' : '0', 'values': null, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0', 'state': 'ok'}]}},
      {'formula' : 'A', 'values': <String, String>{}, 'expectedOutput' : {'state': 'error', 'output': [{'result': 'A', 'state': 'error'}]}},
      {'formula' : '0', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0', 'state': 'ok'}]}},

      {'formula' : 'A', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3', 'state': 'ok'}]}},
      {'formula' : 'AB', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '320', 'state': 'ok'}]}},
      {'formula' : 'A+B', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '23', 'state': 'ok'}]}},
      {'formula' : 'A + B', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '23', 'state': 'ok'}]}},
      {'formula' : '[A + B]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '23', 'state': 'ok'}]}},
      {'formula' : '[A] + [B]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3 + 20', 'state': 'ok'}]}},
      {'formula' : 'AB + C', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '420', 'state': 'ok'}]}},
      {'formula' : '(AB) + C', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '420', 'state': 'ok'}]}},
      {'formula' : 'A(B + C)', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': '3(20 + 100)', 'state': 'error'}]}},
      {'formula' : '[A][(B + C)]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3120', 'state': 'ok'}]}},
      {'formula' : 'A*(B + C)', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '360', 'state': 'ok'}]}},
      {'formula' : '[]', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': '[]', 'state': 'error'}]}},
      {'formula' : '()', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': '()', 'state': 'error'}]}},
      {'formula' : '?!', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': '?!', 'state': 'error'}]}},
      {'formula' : 'A []', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': '3 []', 'state': 'error'}]}},
      {'formula' : 'N []', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': 'N []', 'state': 'error'}]}},
      {'formula' : 'N', 'values': values, 'expectedOutput' : {'state': 'error', 'output': [{'result': 'N', 'state': 'error'}]}},
      {'formula' : 'E', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.14159265359', 'state': 'ok'}]}},
      {'formula' : 'e', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.14159265359', 'state': 'ok'}]}},
      {'formula' : 'Pi', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.14159265359', 'state': 'ok'}]}},
      {'formula' : 'pi', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.14159265359', 'state': 'ok'}]}},
      {'formula' : 'pi * A', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '9.424777960769', 'state': 'ok'}]}},
      {'formula' : 'E * PI', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '9.869604401089', 'state': 'ok'}]}},
      {'formula' : 'E [PI]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': 'E 3.14159265359', 'state': 'ok'}]}},
      {'formula' : '[A*B*2].[C+d+D];', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '120.110;', 'state': 'ok'}]}},
      {'formula' : 'N 52 [QR].[S+T*U*2] E 12 [V*W].[XY + Z]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': 'N 52 10.680 E 12 36.354', 'state': 'ok'}]}},

      //Trim empty space
      {'formula' : 'sin(0) ', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0', 'state': 'ok'}]}}, //Not working because S in Values and so the s of sin will be replaced

      //math library testing
      {'formula' : '36^(1/2)', 'expectedOutput' : {'state': 'ok', 'output': [{'result': '6', 'state': 'ok'}]}},
      {'formula' : 'phi * 2', 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.2360679775', 'state': 'ok'}]}},
      {'formula' : 'log(100,10)', 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.5', 'state': 'ok'}]}},
      {'formula' : 'log(10,100)', 'expectedOutput' : {'state': 'ok', 'output': [{'result': '2', 'state': 'ok'}]}},
      {'formula' : 'pi', 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3.14159265359', 'state': 'ok'}]}},

      //Referencing values
      {'formula' : 'F', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'G', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '18', 'state': 'ok'}]}},
      {'formula' : '[G] + [F]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '18 + 1', 'state': 'ok'}]}},
      {'formula' : '[G + F]', 'values': values, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '19', 'state': 'ok'}]}},
    ];

    _inputsToExpected.forEach((elem) {
      test('formula: ${elem['formula']}, values: ${elem['values']}', () {
        if (elem['values'] == null) {
          var _actual = FormulaParser().parse(elem['formula'], null);
          expect(_actual, elem['expectedOutput']);
        } else {
          var values = <FormulaValue>[];
          elem['values'].entries.forEach((value) {
            values.add(FormulaValue(value.key, value.value));
          });
          var _actual = FormulaParser().parse(elem['formula'], values);
          expect(_actual, elem['expectedOutput']);
        }
      });
    });
  });

  group("FormulaParser.parse - Functionnames contain variables:", () {

    List<Map<String, dynamic>> _inputsToExpected = [
      {'formula' : 'sin(i)', 'values': <String, String>{'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'SIN (i)', 'values': <String, String>{'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'sin  (I)', 'values': <String, String>{'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},

      {'formula' : 'A + sin  (I)', 'values': <String, String>{'a': '2', 'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3', 'state': 'ok'}]}},
      {'formula' : '2 + sin  (I)', 'values': <String, String>{'a': '2', 'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '3', 'state': 'ok'}]}},
      {'formula' : '2 + sin  (I) + S', 'values': <String, String>{'i': '${pi/2}'}, 'expectedOutput' : {'state': 'error', 'output': [{'result': '2 + sin  (1.5707963267948966) + S', 'state': 'error'}]}},
      {'formula' : '2 + sin  (I) + S', 'values': <String, String>{'s': '2', 'i': '${pi/2}'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '5', 'state': 'ok'}]}},

      {'formula' : 'sin(sqrt2)', 'values': <String, String>{'s': '3'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.987765945993', 'state': 'ok'}]}},
      {'formula' : 'sin(pi)', 'values': <String, String>{'s': '3'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0', 'state': 'ok'}]}},
      {'formula' : 'e(e)', 'values': <String, String>{'e': '2'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '7.389056098931', 'state': 'ok'}]}},

      {'formula' : 'arcsin(0.2) + sin(2)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1.110655347616', 'state': 'ok'}]}},
      {'formula' : 'sin(2) + arcsin(0.2)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1.110655347616', 'state': 'ok'}]}},
      {'formula' : 'arcsin(sin(0.2))', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.2', 'state': 'ok'}]}},
      {'formula' : 'sin(arcsin(0.2))', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.2', 'state': 'ok'}]}},
      {'formula' : 'sin(arcsin(0.2))', 'values': <String, String>{'sin': '0.1'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.2', 'state': 'ok'}]}},
      {'formula' : 'sin(arcsin(sin))', 'values': <String, String>{'sin': '0.1'}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '0.1', 'state': 'ok'}]}},

      {'formula' : 'sindeg(90)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'sinDeg(90)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'SINDEG(90)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'round(1.257, 2)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1.26', 'state': 'ok'}]}},
      {'formula' : 'csi(99,88)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '7', 'state': 'ok'}]}},
      {'formula' : 'csi(99) + csi(88)', 'values': <String, String>{}, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '16', 'state': 'ok'}]}},
    ];

    _inputsToExpected.forEach((elem) {
      test('formula: ${elem['formula']}, values: ${elem['values']}', () {
        var values = <FormulaValue>[];
        elem['values'].entries.forEach((value) {
          values.add(FormulaValue(value.key, value.value));
        });
        var _actual = FormulaParser().parse(elem['formula'], values);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("FormulaParser.parse - Expanded functions:", () {

    List<Map<String, dynamic>> _inputsToExpected = [
      {'formula' : 'A', 'values': [FormulaValue('A', '1', type: FormulaValueType.RANGE)], 'expectedOutput' : {'state': 'ok', 'output': [{'result': '1', 'state': 'ok'}]}},
      {'formula' : 'A', 'values': [FormulaValue('A', '1-3', type: FormulaValueType.RANGE)], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '1', 'variables': {'A': '1'}, 'state': 'ok'},
        {'result': '2', 'variables': {'A': '2'}, 'state': 'ok'},
        {'result': '3', 'variables': {'A': '3'}, 'state': 'ok'}
      ]}},
      {'formula' : 'A', 'values': [FormulaValue('A', '1-3', type: FormulaValueType.RANGE)], 'expandValues': false, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '-2', 'state': 'ok'}]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.VALUE),
      ], 'expectedOutput' : {'state': 'ok', 'output': [{'result': '11', 'state': 'ok'}]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.VALUE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '11', 'variables': {'A': '1'}, 'state': 'ok'},
        {'result': '21', 'variables': {'A': '2'}, 'state': 'ok'},
        {'result': '31', 'variables': {'A': '3'}, 'state': 'ok'}
      ]}},

      {'formula' : 'A+B', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.VALUE),
      ], 'expandValues': false, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '-1', 'state': 'ok'}]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.RANGE),
      ], 'expectedOutput' : {'state': 'ok', 'output': [{'result': '11', 'state': 'ok'}]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.RANGE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '11', 'variables': {'A': '1', 'B': '1'}, 'state': 'ok'},
        {'result': '21', 'variables': {'A': '2', 'B': '1'}, 'state': 'ok'},
        {'result': '31', 'variables': {'A': '3', 'B': '1'}, 'state': 'ok'}
      ]}},

      {'formula' : 'A+B', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1', type: FormulaValueType.RANGE),
      ], 'expandValues': false, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '-1', 'state': 'ok'}]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1', type: FormulaValueType.RANGE),
        FormulaValue('B', '1,4-8#2', type: FormulaValueType.RANGE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '11', 'variables': {'A': '1', 'B': '1'}, 'state': 'ok'},
        {'result': '14', 'variables': {'A': '1', 'B': '4'}, 'state': 'ok'},
        {'result': '16', 'variables': {'A': '1', 'B': '6'}, 'state': 'ok'},
        {'result': '18', 'variables': {'A': '1', 'B': '8'}, 'state': 'ok'},
      ]}},

      {'formula' : 'AB', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1,4-8#2', type: FormulaValueType.RANGE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '11', 'variables': {'A': '1', 'B': '1'}, 'state': 'ok'},
        {'result': '14', 'variables': {'A': '1', 'B': '4'}, 'state': 'ok'},
        {'result': '16', 'variables': {'A': '1', 'B': '6'}, 'state': 'ok'},
        {'result': '18', 'variables': {'A': '1', 'B': '8'}, 'state': 'ok'},
        {'result': '21', 'variables': {'A': '2', 'B': '1'}, 'state': 'ok'},
        {'result': '24', 'variables': {'A': '2', 'B': '4'}, 'state': 'ok'},
        {'result': '26', 'variables': {'A': '2', 'B': '6'}, 'state': 'ok'},
        {'result': '28', 'variables': {'A': '2', 'B': '8'}, 'state': 'ok'},
        {'result': '31', 'variables': {'A': '3', 'B': '1'}, 'state': 'ok'},
        {'result': '34', 'variables': {'A': '3', 'B': '4'}, 'state': 'ok'},
        {'result': '36', 'variables': {'A': '3', 'B': '6'}, 'state': 'ok'},
        {'result': '38', 'variables': {'A': '3', 'B': '8'}, 'state': 'ok'}
      ]}},

      {'formula' : 'A+B', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '1,4-8#2', type: FormulaValueType.RANGE),
      ], 'expandValues': false, 'expectedOutput' : {'state': 'error', 'output': [{'result': '1-3+1,4-8#2', 'state': 'error'}]}},

      {'formula' : 'A+B', 'values': [
        FormulaValue('A', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('B', '4-8', type: FormulaValueType.RANGE),
      ], 'expandValues': false, 'expectedOutput' : {'state': 'ok', 'output': [{'result': '-6', 'state': 'ok'}]}},

      {'formula' : 'N 52 [QR].[S+T*U*2] [R] [S] [R+S] [T] [U]', 'values': [
        FormulaValue('Q', '1', type: FormulaValueType.VALUE),
        FormulaValue('R', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('S', '2,6', type: FormulaValueType.RANGE),
        FormulaValue('T', 'S+R', type: FormulaValueType.VALUE),
        FormulaValue('U', 'T+1', type: FormulaValueType.VALUE),
        FormulaValue('N', '7', type: FormulaValueType.VALUE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': 'N 52 11.26 1 2 3 3 4', 'variables': {'R': '1', 'S': '2'}, 'state': 'ok'},
        {'result': 'N 52 11.118 1 6 7 7 8', 'variables': {'R': '1', 'S': '6'}, 'state': 'ok'},
        {'result': 'N 52 12.42 2 2 4 4 5', 'variables': {'R': '2', 'S': '2'}, 'state': 'ok'},
        {'result': 'N 52 12.150 2 6 8 8 9', 'variables': {'R': '2', 'S': '6'}, 'state': 'ok'},
        {'result': 'N 52 13.62 3 2 5 5 6', 'variables': {'R': '3', 'S': '2'}, 'state': 'ok'},
        {'result': 'N 52 13.186 3 6 9 9 10', 'variables': {'R': '3', 'S': '6'}, 'state': 'ok'}
      ]}},

      {'formula' : 'N 52 [QR].[S+T*U*2] [R] [S] [R+S] [T] [U]', 'values': [
        FormulaValue('R', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('S', '2,6', type: FormulaValueType.RANGE),
        FormulaValue('T', 'S+R', type: FormulaValueType.VALUE),
        FormulaValue('U', 'T+1', type: FormulaValueType.VALUE),
        FormulaValue('N', '7', type: FormulaValueType.VALUE),
      ], 'expectedOutput' : {'state': 'expanded_error', 'output': [
        {'result': 'N 52 [Q1].26 1 2 3 3 4', 'variables': {'R': '1', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q1].118 1 6 7 7 8', 'variables': {'R': '1', 'S': '6'}, 'state': 'error'},
        {'result': 'N 52 [Q2].42 2 2 4 4 5', 'variables': {'R': '2', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q2].150 2 6 8 8 9', 'variables': {'R': '2', 'S': '6'}, 'state': 'error'},
        {'result': 'N 52 [Q3].62 3 2 5 5 6', 'variables': {'R': '3', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q3].186 3 6 9 9 10', 'variables': {'R': '3', 'S': '6'}, 'state': 'error'}
      ]}},

      {'formula' : 'N 52 [QR].[S+T*U*2] [R] [S] [R+S] [T] [U]', 'values': [
        FormulaValue('R', '1-3', type: FormulaValueType.RANGE),
        FormulaValue('S', '2,6', type: FormulaValueType.RANGE),
        FormulaValue('T', 'S+R', type: FormulaValueType.VALUE),
        FormulaValue('U', 'T+1', type: FormulaValueType.VALUE),
        FormulaValue('N', '7', type: FormulaValueType.VALUE),
      ], 'expectedOutput' : {'state': 'expanded_error', 'output': [
        {'result': 'N 52 [Q1].26 1 2 3 3 4', 'variables': {'R': '1', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q1].118 1 6 7 7 8', 'variables': {'R': '1', 'S': '6'}, 'state': 'error'},
        {'result': 'N 52 [Q2].42 2 2 4 4 5', 'variables': {'R': '2', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q2].150 2 6 8 8 9', 'variables': {'R': '2', 'S': '6'}, 'state': 'error'},
        {'result': 'N 52 [Q3].62 3 2 5 5 6', 'variables': {'R': '3', 'S': '2'}, 'state': 'error'},
        {'result': 'N 52 [Q3].186 3 6 9 9 10', 'variables': {'R': '3', 'S': '6'}, 'state': 'error'}
      ]}},

      // no duplicates
      {'formula' : '[A + B]', 'values': [
        FormulaValue('A', '1,3,5', type: FormulaValueType.RANGE),
        FormulaValue('B', '2-8#2', type: FormulaValueType.RANGE),
        FormulaValue('C', '10-12', type: FormulaValueType.RANGE),
      ], 'expectedOutput' : {'state': 'expanded_ok', 'output': [
        {'result': '3', 'state': 'ok', 'variables': {'A': '1', 'B': '2', 'C': '10'}},
        {'result': '5', 'state': 'ok', 'variables': {'A': '1', 'B': '4', 'C': '10'}},
        {'result': '7', 'state': 'ok', 'variables': {'A': '1', 'B': '6', 'C': '10'}},
        {'result': '9', 'state': 'ok', 'variables': {'A': '1', 'B': '8', 'C': '10'}},
        {'result': '11', 'state': 'ok', 'variables': {'A': '3', 'B': '8', 'C': '10'}},
        {'result': '13', 'state': 'ok', 'variables': {'A': '5', 'B': '8', 'C': '10'}}
      ]}},
    ];

    _inputsToExpected.forEach((elem) {
      test('formula: ${elem['formula']}, values: ${elem['values']}, expandValues: ${elem['expandValues']}', () {
        var _actual;
        if (elem['expandValues'] == null)
          _actual = FormulaParser().parse(elem['formula'], elem['values']);
        else
          _actual = FormulaParser().parse(elem['formula'], elem['values'], expandValues: elem['expandValues']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });
}