import "package:flutter_test/flutter_test.dart";
import 'package:gc_wizard/logic/tools/crypto_and_encodings/esoteric_programming_languages/piet/generator.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/esoteric_programming_languages/piet/piet_image_reader.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/esoteric_programming_languages/piet/piet_session.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/esoteric_programming_languages/piet/piet_stack.dart';
import 'package:gc_wizard/widgets/utils/file_utils.dart';

void main() {
  group("Piet.PietSession:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      // {'code': null, 'expectedOutput': ''},
      // {'code': '', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_hello_artistic2.gif', 'expectedOutput': ''},
      //{'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_alpha_filled.png', 'expectedOutput': ''},
       {'path': r'H:\Meine Ablage\PietSharp-main\Images\piet_factorial_big.png', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_fizzbuzz.png', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_hello.png', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_hello_artistic.gif', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_helloworld-mondrian-big.png', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_nfib.gif', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_nprime.gif', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_power2_big.png', 'expectedOutput': ''},
      // {'path': r'H:\Meine Ablage\PietSharp-main\Images\Piet_tetris.png', 'expectedOutput': ''},
    ];

    _inputsToExpected.forEach((elem) {
      test('path: ${elem['path']}, input: ${elem['input']}', () async {

        var data  = await readByteDataFromFile(elem['path']);
        var imageReader = PietImageReader();
        var _pietPixels = imageReader.ReadImage(data);

        var _actual = await interpretPiet(_pietPixels, []);
        expect(_actual.output, elem['expectedOutput']);
      });
    });
  });

  group("Piet.generatePiet:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'input': 'Hello World!', 'expectedOutput': null},
    ];

    _inputsToExpected.forEach((elem) async {
      test('input: ${elem['input']}', () async {

        var _actual = await generatePiet(elem['input']);
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("Piet.StackModOp:", () {
    List<Map<String, dynamic>> _inputsToExpected = [
      {'value1': 5, 'value2': 3,  'expectedOutput': 2},
      {'value1': 2, 'value2': 3,  'expectedOutput': 2},
      {'value1':-1, 'value2': 3,  'expectedOutput': 2},
      {'value1':-4, 'value2': 3,  'expectedOutput': 2},
      {'value1': 7, 'value2': 42, 'expectedOutput': 7}
    ];

    _inputsToExpected.forEach((elem) {
      test('value1: ${elem['value1']}, value2: ${elem['value2']}', () async {

        PietStack stack = new PietStack();

        stack.Push(elem['value1']);
        stack.Push(elem['value2']);

        stack.Mod();

        var _actual = stack.Pop();
        expect(_actual, elem['expectedOutput']);
      });
    });
  });

  group("Piet.BasicSession:", () {
    var data = {
    {0xC00000, 0XFF0000, 0XFF0000, 0xC00000, 0xFFC0FF, 0xFFC0FF}.toList(),
    {0xFF0000, 0xFF0000, 0xC00000, 0xC00000, 0x000000, 0xFFC0FF}.toList(),
    {0xFF0000, 0xFF0000, 0x000000, 0xFFC0FF, 0xFFC0FF, 0xFFC0FF}.toList(),
    {0xFF0000, 0xFF0000, 0xC00000, 0x000000, 0x000000, 0x000000}.toList(),
    {0xFF0000, 0xFF0000, 0x000000, 0xFF0000, 0x000000, 0x000000}.toList(),
    }.toList();

    List<Map<String, dynamic>> _inputsToExpected = [
      {'input': data, 'expectedOutput': '10'},
    ];

    _inputsToExpected.forEach((elem) {
      test('input: ${elem['input']}', () async {
        var result = await interpretPiet(data, []);

        expect(result.state.Running, false);
        
        expect(result.output, elem['expectedOutput']);
      });
    });
  });
}
