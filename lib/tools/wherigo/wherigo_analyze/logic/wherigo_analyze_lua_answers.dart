part of 'package:gc_wizard/tools/wherigo/wherigo_analyze/logic/wherigo_analyze.dart';

bool _insideSectionOnGetInput(String currentLine) {
  if (currentLine.endsWith(':OnGetInput(input)')) {
    return false;
  }
  return true;
}

WherigoAnswer _analyzeAndExtractOnGetInputSectionData(List<String> lines) {
  List<WherigoAnswerData> resultAnswerData = [];
  bool _insideInputFunction = true;

  List<WherigoActionMessageElementData> _answerActions = [];
  List<String> _answerList = [];
  String _answerHash = '';

  String resultInputFunction = '';

  for (int i = 0; i < lines.length; i++) {
    // getting name of input function
    if (lines[i].endsWith(':OnGetInput(input)')) {
      resultInputFunction = lines[i].replaceAll('function ', '').replaceAll(':OnGetInput(input)', '').trim();
      print('found ongetinput '+resultInputFunction);
    }

    if (lines[i].trim().endsWith('= tonumber(input)')) {
      _answerVariable = lines[i].trim().replaceAll(' = tonumber(input)', '');
    } else if (lines[i].trim().endsWith(' = input')) {
      _answerVariable = lines[i].trim().replaceAll(' = input', '');
    } else if (lines[i].trimLeft() == 'if input == nil then') {
      // suppress this
      //answer = 'NIL';
      i++;
      lines[i] = lines[i].trim();
      _answerVariable = 'input';
      _sectionAnalysed = false;
      do {
        i++;
        lines[i] = lines[i].trim();
        if (lines[i].trim() == 'end') _sectionAnalysed = true;
      } while (!_sectionAnalysed); // end of section
    } // end of NIL

    else if (_OnGetInputSectionEnd(lines[i])) {
      print('found answer '+lines[i]);
      if (_insideInputFunction) {
        for (var answer in _answerList) {
          if (answer != 'NIL') {
            //if (_Answers[_inputObject] == null) {
            //  continue; // TODO Thomas Maybe not necessary if concrete return value is used
            //}

            resultAnswerData.add(WherigoAnswerData(
              AnswerAnswer: answer,
              AnswerHash: _answerHash,
              AnswerActions: _answerActions,
            ));
          }
        }
        _answerActions = [];
        _answerList = _getAnswers(i, lines[i], lines[i - 1], _cartridgeVariables);
      }
    } else if ((i + 1 < lines.length - 1) && _OnGetInputFunctionEnd(lines[i], lines[i + 1].trim())) {
      if (_insideInputFunction) {
        _insideInputFunction = false;
        for (var answer in _answerList) {
          //if (_Answers[_inputObject] == null) continue;

          if (answer != 'NIL') {
            resultAnswerData.add(WherigoAnswerData(
              AnswerAnswer: answer,
              AnswerHash: _answerHash,
              AnswerActions: _answerActions,
            ));
          }
        }
        _answerActions = [];
        _answerList = [];
        _answerVariable = '';
      }
    } else if (lines[i].trimLeft().startsWith('Buttons')) {
      do {
        i++;
        lines[i] = lines[i].trim();
        if (!(lines[i].trim() == '}' || lines[i].trim() == '},')) {
          if (lines[i].trimLeft().startsWith(_obfuscatorFunction)) {
            _answerActions.add(WherigoActionMessageElementData(
                ActionMessageType: WHERIGO_ACTIONMESSAGETYPE.BUTTON,
                ActionMessageContent: deobfuscateUrwigoText(lines[i].trim().replaceAll(_obfuscatorFunction + '("', '').replaceAll('")', ''),
                    _obfuscatorTable)));
          } else {
            _answerActions.add(WherigoActionMessageElementData(
                ActionMessageType: WHERIGO_ACTIONMESSAGETYPE.BUTTON,
                ActionMessageContent: lines[i].trim().replaceAll(_obfuscatorFunction + '("', '').replaceAll('")', '')));
          }
        }
      } while (!lines[i].trim().startsWith('}'));
    } // end buttons

    else {
      if (_isMessageActionElement(lines[i].trimLeft())) {
        _answerActions.add(_handleAnswerLine(lines[i].trimLeft()));
      }
    } // end if other line content
  }
  return WherigoAnswer(
      InputFunction: resultInputFunction,
      InputAnswers: resultAnswerData,
  );
}

List<String> _getAnswers(int i, String line, String lineBefore, List<WherigoVariableData> variables) {
  if (line.trim().startsWith('if input == ') ||
      line.trim().startsWith('if input >= ') ||
      line.trim().startsWith('if input <= ') ||
      line.trim().startsWith('elseif input == ') ||
      line.trim().startsWith('elseif input >= ') ||
      line.trim().startsWith('elseif input <= ') ||
      line.trim().startsWith('if ' + _answerVariable + ' == ') ||
      line.trim().startsWith('elseif ' + _answerVariable + ' == ')) {
    if (line.contains('<=') && line.contains('>=')) {
      return [
        line
            .trimLeft()
            .replaceAll('if', '')
            .replaceAll('else', '')
            .replaceAll('==', '')
            .replaceAll('then', '')
            .replaceAll(' ', '')
            .replaceAll('and', ' and ')
            .replaceAll('or', ' or ')
      ];
    }
    return line
        .trimLeft()
        .replaceAll('if', '')
        .replaceAll('else', '')
        .replaceAll('input', '')
        .replaceAll('==', '')
        .replaceAll('then', '')
        .replaceAll(_answerVariable, '')
        .replaceAll(' ', '')
        .replaceAll('and', ' and ')
        .split(RegExp(r'(or)'));
  } else if (RegExp(r'(_Urwigo.Hash)').hasMatch(line)) {
    List<String> results = [];
    int hashvalue = 0;
    line = line.split('and')[0];
    line = line
        .trim()
        .replaceAll('if ', '')
        .replaceAll('elseif ', '')
        .replaceAll('_Urwigo.Hash', '')
        .replaceAll('input', '')
        .replaceAll('=', '')
        .replaceAll('string.lower', '')
        .replaceAll('string.upper', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('then', '')
        .replaceAll('else', '')
        .replaceAll('true', '')
        .replaceAll('and', '')
        .replaceAll('Contains', '')
        .replaceAll('Player', '')
        .replaceAll(':', '')
        .replaceAll(' ', '')
        .replaceAll(RegExp(r'[^or0-9]'), '+')
        .replaceAll('o+', '+')
        .replaceAll('+r', '+')
        .replaceAll('+', '');
    line.split('or').forEach((element) {
      hashvalue = int.parse(element.replaceAll('D+', ''));
      results.add(hashvalue.toString() +
          '\x01' +
          breakUrwigoHash(hashvalue, HASH.ALPHABETICAL).toString() +
          '\x01' +
          breakUrwigoHash(hashvalue, HASH.NUMERIC).toString());
    });
    return results;
  } else if (line.trim().startsWith('if Wherigo.NoCaseEquals(') ||
      line.trim().startsWith('elseif Wherigo.NoCaseEquals(')) {
    if (_answerVariable.isEmpty) _answerVariable = _getVariable(lineBefore);
    line = line
        .trim()
        .replaceAll('if ', '')
        .replaceAll('elseif ', '')
        .replaceAll('Wherigo.NoCaseEquals', '')
        .replaceAll(_answerVariable, '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('"', '')
        .replaceAll(',', '')
        .replaceAll('then', '')
        .replaceAll('tostring', '')
        .replaceAll('else', '')
        .replaceAll('input', '')
        .replaceAll('Answer,', '')
        .trim();
    //if (RegExp(r'(' + obfuscator + ')').hasMatch(line)) {
    //  line = deobfuscateUrwigoText(line.replaceAll(obfuscator, '').replaceAll('("', '').replaceAll('")', ''), dtable);
    //}
    line = line.split(' or ').map((element) {
      return element.trim();
    }).join('\n');
    line = removeWWB(line);
    // check if variable then provide information
    for (int i = 0; i < variables.length; i++) {
      if (line == variables[i].VariableLUAName) {
        line = variables[i].VariableName + '\x01' + line;
        i = variables.length;
      }
    }
    if (line.isEmpty) {
      return ['NIL'];
    }
    return [line];
  }

  throw Exception(
      'No Answers found'); // TODO Thomas: Please check if empty list instead is logically meaningful; I chose Exception because I believe this line should never be reached.
}

bool _OnGetInputSectionEnd(String line) {
  if (line.trim().startsWith('if input == ') ||
      line.trim().startsWith('if input >= ') ||
      line.trim().startsWith('if input <= ') ||
      line.trim().startsWith('elseif input == ') ||
      line.trim().startsWith('elseif input >= ') ||
      line.trim().startsWith('elseif input <= ') ||
      line.trim().startsWith('if _Urwigo.Hash(') ||
      line.trim().startsWith('if (_Urwigo.Hash(') ||
      line.trim().startsWith('elseif _Urwigo.Hash(') ||
      line.trim().startsWith('elseif (_Urwigo.Hash(') ||
      line.trim().startsWith('if Wherigo.NoCaseEquals(') ||
      line.trim().startsWith('elseif Wherigo.NoCaseEquals(') ||
      line.trim().startsWith('if ' + _answerVariable + ' == ') ||
      line.trim().startsWith('elseif ' + _answerVariable + ' == ')) {
    return true;
  } else {
    return false;
  }
}

bool _OnGetInputFunctionEnd(String line1, String line2) {
  return (line1.trimLeft().startsWith('end') &&
      (line2.trimLeft().startsWith('function') || line2.trimLeft().startsWith('return')));
}