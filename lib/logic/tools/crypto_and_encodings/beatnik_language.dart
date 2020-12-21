import 'package:gc_wizard/logic/tools/games/scrabble.dart';
import 'package:gc_wizard/logic/tools/games/scrabble_sets.dart';

class BeatnikOutput{
  final List<String> output;
  final List<String> assembler;
  final List<String> memnonic;

  BeatnikOutput(this.output, this.assembler, this.memnonic);
}


BeatnikOutput generateBeatnik(var ScrabbleVersion, output){
  List<int> assembler = new List<int>();
  var outputlist;
  outputlist = output.split('').reversed.join('');
  for (int i = 0; i < outputlist.length; i++) {
    assembler.add(5);
    assembler.add(outputlist[i].codeUnitAt(0));
  }
  for (int i = 0; i < outputlist.length; i++) {
    assembler.add(9);
  }
  assembler.add(17);

  List<String> assemblerProgramm = new List<String>();
  List<String> memnonicProgramm = new List<String>();
  for (int i = 0; i < assembler.length; i++){
    if (assembler[i] == 5 || assembler[i] == 13 || assembler[i] == 14 || assembler[i] == 15 || assembler[i] == 16) {
      assemblerProgramm.add(assembler[i].toString() + ' ' + assembler[i + 1].toString());
      memnonicProgramm.add(memnonic(assembler[i]) + ' ' + assembler[i + 1].toString());
      i++;
    } else {
      assemblerProgramm.add(assembler[i].toString());
      memnonicProgramm.add(memnonic(assembler[i]));
    }
  }

  return  BeatnikOutput(['beatnik_hint_generated'], assemblerProgramm, memnonicProgramm);
}


class BeatnikStack {
  List<int> _stack;

  BeatnikStack() {
    _stack = new List<int>();
  }

  void push(int c) {
    if (c != null)
      _stack.add(c);
  }

  int peek() {
    var c = _stack[_stack.length - 1];
    return c;
  }

  int pop()  {
    if (_stack.length != 0) {
      var c = _stack.removeAt(_stack.length - 1);
      return c;
    }
  }

  int size() {
    return _stack.length;
  }

  void add(){
    int a = pop();
    int b = pop();
    push(a + b);
  }

  void sub(){
    int a = pop();
    int b = pop();
    push(a - b);
  }

  void swap(){
    int a = pop();
    int b = pop();
    push(a);
    push(b);
  }

  void double(){
    int a = pop();
    push(a);
    push(a);
  }
}

final memnonicTable = {0 : 'noop', 1 : 'noop', 2 : 'noop', 3 : 'noop', 4 : 'noop',
  5 : 'push', 6 : 'pop', 7 : 'add', 8 : 'push input', 9 : 'pop output', 10 : 'sub', 11 : 'swap', 12 : 'double',
  13 : 'jump z +', 14 : 'jump nz +', 15 : 'jump z -', 16 : 'jump nz -', 17 : 'exit',
  18 : 'noop', 19 : 'noop', 20 : 'noop', 21 : 'noop', 22 : 'noop', 23 : 'noop' };

String memnonic(int command){
  if (command >= 5 && command <= 17)
    return memnonicTable[command];
  else
    return ' ';
}

BeatnikOutput interpretBeatnik(var ScrabbleVersion, String sourcecode, input){
  if (sourcecode == null || sourcecode == '')
    return  BeatnikOutput([''], [''], ['']);

  var _currentValues = [];
  int value = 0;

  List<int> assembler = new List<int>();
  List<String> programm = sourcecode
      .replaceAll(new RegExp(r'[^A-Z]'),'#')
      .replaceAll(new RegExp(r'\s\n\r\t\0'),'#')
      .replaceAll('##','#')
      .split('#');
  for (int i = 0; i < programm.length; i++){
    _currentValues = textToLetterValues(programm[i], ScrabbleVersion);
    value = 0;
    for (int j = 0; j < _currentValues.length; j++) {
      value = value + _currentValues[j];
    }
    if (value > 0) {
      assembler.add(value);
    }
  }

  List<String> assemblerProgramm = new List<String>();
  List<String> memnonicProgramm = new List<String>();
  for (int i = 0; i < assembler.length; i++){
    if (assembler[i] == 5 || assembler[i] == 13 || assembler[i] == 14 || assembler[i] == 15 || assembler[i] == 16) {
      assemblerProgramm.add(assembler[i].toString() + ' ' + assembler[i + 1].toString());
      memnonicProgramm.add(memnonic(assembler[i]) + ' ' + assembler[i + 1].toString());
      i++;
    } else {
      assemblerProgramm.add(assembler[i].toString());
      memnonicProgramm.add(memnonic(assembler[i]));
    }
  }

  List<String> inputlist = input.split('');

  BeatnikStack stack = new BeatnikStack();

  String output = '';
  bool exit = false;
  int command = 0;
  int pc = 0;
  int inputindex = 0;
  while (!exit && pc < assembler.length){
    command = assembler[pc];
    switch (command) {
      case 5: // push n
        if (pc + 1 < assembler.length - 1) {
          pc++;
          stack.push(assembler[pc]);
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc', 'beatnik_error_runtime_push'], assemblerProgramm, memnonicProgramm);
        break;
      case 6: // pop
        if (stack.size() >= 1) {
          stack.pop();
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_pop'], assemblerProgramm, memnonicProgramm);
        break;
      case 7: // add
        if (stack.size() >= 2) {
          stack.add();
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_add'], assemblerProgramm, memnonicProgramm);
        break;
      case 8: // push input
        if (inputindex < inputlist.length - 1) {
          stack.push(inputlist[inputindex].codeUnitAt(0));
          inputindex++;
        } else {
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_invalid_input'], assemblerProgramm, memnonicProgramm);
        }
        break;
      case 9: // pop output
        if (stack.size() >= 1) {
          output = output + String.fromCharCode(stack.pop());
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_pop_output'], assemblerProgramm, memnonicProgramm);
        break;
      case 10: // sub
        if (stack.size() >= 2) {
          stack.sub();
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_sub'], assemblerProgramm, memnonicProgramm);
        break;
      case 11: //swap
        if (stack.size() >= 2) {
          stack.swap();
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_swap'], assemblerProgramm, memnonicProgramm);
        break;
      case 12: //double
        if (stack.size() >= 1) {
          stack.double();
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_double'], assemblerProgramm, memnonicProgramm);
        break;
      case 13: // jump z +
        if (stack.size() >= 1) {
          if (stack.pop() == 0)
            if (pc + 1 <= assembler.length - 1) {
              pc++;
              pc = pc + assembler[pc];
            } else
              return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc', 'beatnik_error_runtime_jmpz_f'], assemblerProgramm, memnonicProgramm);
          else
            pc++;
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_jmpz_f'], assemblerProgramm, memnonicProgramm);
        break;
      case 14: // jump nz +
        if (stack.size() >= 1) {
          if (stack.pop() != 0)
            if (pc + 1 <= assembler.length - 1) {
              pc++;
              pc = pc + assembler[pc];
            } else
              return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc', 'beatnik_error_runtime_jmpnz_f'], assemblerProgramm, memnonicProgramm);
          else
            pc++;
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_jmpnz_f'], assemblerProgramm, memnonicProgramm);
        break;
      case 15: // jump z -
        if (stack.size() >= 1) {
          if (stack.pop() == 0)
            if (pc + 1 <= assembler.length - 1) {
              pc = pc - assembler[pc + 1];
            } else
              return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc', 'beatnik_error_runtime_jmpz_b'], assemblerProgramm, memnonicProgramm);
          else
            pc++;
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_jmpz_b'], assemblerProgramm, memnonicProgramm);
        break;
      case 16: // jump nz -
        if (stack.size() >= 1) {
          if (stack.pop() != 0)
            if (pc + 1 <= assembler.length - 1) {
              pc = pc - assembler[pc + 1];
            } else
              return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc' 'beatnik_error_runtime_jmpnz_b'], assemblerProgramm, memnonicProgramm);
          else
            pc++;
        } else
          return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_stack', 'beatnik_error_runtime_jmpnz_b'], assemblerProgramm, memnonicProgramm);
        break;
      case 17: // exit
        exit = true;
        break;
    }
    pc++;
    if (pc < 0)
      return BeatnikOutput(['beatnik_error_runtime', 'beatnik_error_runtime_pc'], assemblerProgramm, memnonicProgramm);
  }
  return BeatnikOutput([output], assemblerProgramm, memnonicProgramm);
}
