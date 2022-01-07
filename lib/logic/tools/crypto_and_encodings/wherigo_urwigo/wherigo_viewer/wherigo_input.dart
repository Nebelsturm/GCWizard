
import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/urwigo_tools.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/wherigo_viewer/wherigo_common.dart';

class InputData{
  final String InputLUAName;
  final String InputID;
  final String InputName;
  final String InputDescription;
  final String InputVisible;
  final String InputMedia;
  final String InputIcon;
  final String InputType;
  final String InputText;
  final List<String> InputChoices;
  final List<AnswerData> InputAnswers;

  InputData(
      this.InputLUAName,
      this.InputID,
      this.InputName,
      this.InputDescription,
      this.InputVisible,
      this.InputMedia,
      this.InputIcon,
      this.InputType,
      this.InputText,
      this.InputChoices,
      this.InputAnswers);
}

class AnswerData{
  final String AnswerAnswer;
  final List<ActionData> AnswerActions;

  AnswerData(
      this.AnswerAnswer,
      this.AnswerActions,
      );
}

class ActionData{
  final String ActionType;
  final String ActionContent;

  ActionData(
      this.ActionType,
      this.ActionContent
      );
}

Map<String, dynamic> getInputsFromCartridge(String LUA, dtable, obfuscator){
  RegExp re = RegExp(r'( = Wherigo.ZInput)');
  List<String> lines = LUA.split('\n');

  bool section = true;
  bool sectionChoices = true;
  String LUAname = '';
  String id = '';
  String name = '';
  String description = '';
  String visible = '';
  String media = '';
  String icon = '';
  String inputType = '';
  String text = '';
  List<String> choices = [];
  List<AnswerData> answers = [];

  String inputObject = '';
  String question = '';
  String help = '';
  String answer = '';
  List<String> answerList = [];
  Map<String, List<AnswerData>> Answers = {};
  ActionData action;
  List<ActionData> answerActions = [];
  bool sectionAnalysed = false;
  bool insideInputFunction = false;

  List<InputData> Inputs = [];
  List<InputData> resultInputs = [];
  Map<String, ObjectData> NameToObject = {};
  var out = Map<String, dynamic>();

  for (int i = 0; i < lines.length - 1; i++){

    // get all ZInput-Objects
    if (re.hasMatch(lines[i])) {
      LUAname = '';
      id = '';
      name = '';
      description = '';
      visible = '';
      media = '';
      icon = '';
      inputType = '';
      text = '';
      choices = [];

      LUAname = getLUAName(lines[i]);

      i++;
      id = getLineData(lines[i], LUAname, 'Id', obfuscator, dtable);

      i++;
      name = getLineData(lines[i], LUAname, 'Name', obfuscator, dtable);

      description = '';
      section = true;
      i++;
      do {
        description = description + lines[i];
        i++;
        if (i > lines.length - 1 || lines[i].startsWith(LUAname + '.Visible'))
          section = false;
      } while (section);
      description = getLineData(description, LUAname, 'Description', obfuscator, dtable);

      section = true;
      do {
        if (i < lines.length - 1) {
          if (lines[i].startsWith(LUAname + '.Visible')) {
            visible = getLineData(
                lines[i], LUAname, 'Visible', obfuscator, dtable);
          }

          if (lines[i].startsWith(LUAname + '.Media')){
            media = getLineData(
                lines[i], LUAname, 'Media', obfuscator, dtable);
          }

          if (lines[i].startsWith(LUAname + '.Icon')){
            icon = getLineData(
                lines[i], LUAname, 'Icon', obfuscator, dtable);
          }

          if (lines[i].startsWith(LUAname + '.InputType')) {
            inputType = getLineData(
                lines[i], LUAname, 'InputType', obfuscator, dtable);
          }

          if (lines[i].startsWith(LUAname + '.Text')) {
            text = getLineData(
                lines[i], LUAname, 'Text', obfuscator, dtable);
          }

          if (lines[i].startsWith(LUAname + '.Choices')) {
            choices = [];
            if (lines[i].startsWith(LUAname + '.InputType')) {
              choices.addAll(getChoicesSingleLine(lines[i], LUAname, obfuscator, dtable));
            } else {
              i++;
              sectionChoices = true;
              do {
                if (lines[i].trimLeft().startsWith('"')) {
                  choices.add(lines[i ].trimLeft().replaceAll('"', '').replaceAll(',', ''));
                  i++;
                } else {
                  sectionChoices = false;
                }
              } while (sectionChoices);
            }
          }

          if (lines[i].startsWith(LUAname + '.Text'))
            section = false;
        }
        i++;
      } while (section);
      i--;
      Inputs.add(InputData(
        LUAname,
        id,
        name,
        description,
        visible,
        media,
        icon,
        inputType,
        text,
        choices,
        answers,
      ));
      NameToObject[LUAname] = ObjectData(id, name, media);
    }

    // get all Answers
    if (lines[i].trimRight().endsWith(':OnGetInput(input)')) {
      // function for getting all inputs for an inputobject found
      insideInputFunction = true;
      inputObject = '';
      question = '';
      help = '';
      answer = '';
      answerActions = [];

      // getting name of function
      inputObject = lines[i].replaceAll('function ', '').replaceAll(
          ':OnGetInput(input)', '');
      Answers[inputObject] = [];
    } // end if identify input function

    if (lines[i].trimLeft() == 'input = tonumber(input)') {
      // do nothing;
    }

    else if (lines[i].trimLeft() == 'if input == nil then') {
      // suppress this
      //answer = 'NIL';
      i++;
      sectionAnalysed = false;
      do {
        // if (lines[i].trimLeft().startsWith('Buttons = ')) {
        //   do {
        //     i++;
        //     if (lines[i].trim() != '}' || lines[i].trim() != '{,') {
        //       if (lines[i].trimLeft().startsWith(obfuscator))
        //         answerActions.add(ActionData('btn', deobfuscateUrwigoText(lines[i].trim().replaceAll(obfuscator + '("', '').replaceAll('")', ''), dtable)));
        //       else
        //         answerActions.add(ActionData('btn', lines[i].trim().replaceAll(obfuscator + '("', '').replaceAll('")', '')));
        //     }
        //   } while (!lines[i].trim().startsWith('}'));
        // } // end if buttons
        // else {
        //   action = _handleLine(lines[i].trimLeft(), dtable, obfuscator);
        //   if (action != null)
        //     answerActions.add(action);
        // } // end if other line content
        i++;
        if (lines[i].trim() == 'end')
          sectionAnalysed = true;
      } while (!sectionAnalysed); // end of section

      // result.add(AnswerData(
      //   inputObject,
      //   question,
      //   help,
      //   answer,
      //   answerActions,
      // ));
      // answerActions = [];
    } // end of NIL

    else if (_SectionEnd(lines[i])) { //
      if (insideInputFunction) {
        answerList.forEach((answer) {
          Answers[inputObject].add(AnswerData(
            answer,
            answerActions,
          ));
        });
        answerActions = [];
        answerList = _getAnswers(i, lines[i], lines[i - 1]);
      }
    }

    else if (_FunctionEnd(lines[i], lines[i + 1])) {
      if (insideInputFunction) {
        insideInputFunction = false;
        answerList.forEach((answer) {
          Answers[inputObject].add(AnswerData(
            answer,
            answerActions,
          ));
        });
        answerActions = [];
        answerList = [];
      }
    }

    else { // handle action
      if (lines[i].trimLeft().startsWith('Buttons = ')) {
        do {
          i++;
          if (lines[i].trim() != '}' || lines[i].trim() != '{,') {
            if (lines[i].trimLeft().startsWith(obfuscator)) {
              answerActions.add(ActionData(
                  'btn', deobfuscateUrwigoText(lines[i].trim().replaceAll(obfuscator + '("', '').replaceAll('")', ''), dtable)));
            } else {
              answerActions.add(ActionData('btn', lines[i].trim().replaceAll(obfuscator + '("', '').replaceAll('")', '')));
            }
          }
        } while (!lines[i].trim().startsWith('}'));
      } // end if buttons
      else {
        action = _handleLine(lines[i].trimLeft(), dtable, obfuscator);
        if (action != null)
          answerActions.add(action);
      } // end if other line content
    }


    // combine Inputs and Answers


  };

  Inputs.forEach((element) {
    resultInputs.add(
        InputData(
            element.InputLUAName,
            element.InputID,
            element.InputName,
            element.InputDescription,
            element.InputVisible,
            element.InputMedia,
            element.InputIcon,
            element.InputType,
            element.InputText,
            element.InputChoices,
            Answers[element.InputLUAName])
    );
  });

  out.addAll({'content': resultInputs});
  out.addAll({'names': NameToObject});
  return out;
}

List<String> _getAnswers(int i, String line, String lineBefore){
  if (line.trim().startsWith('if input == ') ||
      line.trim().startsWith('elseif input == ')) {
    return line.trimLeft()
        .replaceAll('if', '')
        .replaceAll('else', '')
        .replaceAll('input == ', '')
        .replaceAll('then', '')
        .replaceAll(' ', '')
        .split('or');
  }
  else if (line.trim().startsWith('if _Urwigo.Hash(') ||
      line.trim().startsWith('elseif _Urwigo.Hash(')) {
    List<String> results = [];
    int hashvalue = 0;
    line.trim()
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
        .replaceAll(' ', '')
        .split('or').forEach((element) {
      hashvalue = int.parse(element);
      results.add(breakUrwigoHash(hashvalue).toString());
    });
    return results;
  }
  else if (line.trim().startsWith('if Wherigo.NoCaseEquals(') ||
      line.trim().startsWith('elseif Wherigo.NoCaseEquals(')) {
    if (lineBefore.endsWith('= input'))
      lineBefore = lineBefore.trim().replaceAll(' = input', '').replaceAll(' ', '');
    return [line.trim()
        .replaceAll('if ', '')
        .replaceAll('elseif ', '')
        .replaceAll('Wherigo.NoCaseEquals', '')
        .replaceAll(lineBefore + ',', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('"', '')
        .replaceAll('then', '')
        .replaceAll('else', '')
        .replaceAll(' ', '')];
  }
}

bool _SectionEnd(String line){
  if (line.trim().startsWith('if input == ') ||
      line.trim().startsWith('elseif input == ') ||
      line.trim().startsWith('if _Urwigo.Hash(') ||
      line.trim().startsWith('elseif _Urwigo.Hash(') ||
      line.trim().startsWith('if Wherigo.NoCaseEquals(') ||
      line.trim().startsWith('elseif Wherigo.NoCaseEquals('))
    return true;
  else
    return false;
}

bool _FunctionEnd(String line1, String line2) {
  return (line1.trim() == 'end' && line2.trimLeft().startsWith('function'));
}


ActionData _handleLine(String line, String dtable, String obfuscator) {
  if (line.startsWith('_Urwigo') ||
      line.startsWith('Callback') ||
      line.startsWith('Wherigo') ||
      line.startsWith('Buttons') ||
      line.startsWith('end') ||
      line == ']]' ||
      line.startsWith('if action') ||
      line.startsWith('{') ||
      line.startsWith('}'))
    return null;
  else
  if (line.startsWith('Text = '))
    return ActionData('txt', getTextData(line, obfuscator, dtable));
  else
  if (line.startsWith('Media = '))
    return ActionData('img', line.trimLeft().replaceAll('Media = ', ''));
  else
  if (line.startsWith('if '))
    return ActionData('cse', line.trimLeft());
  if (line.startsWith('elseif '))
    return ActionData('cse', line.trimLeft());
  if (line.startsWith('else'))
    return ActionData('cse', line.trimLeft());
  else
    return ActionData('act', line.trimLeft());
}
