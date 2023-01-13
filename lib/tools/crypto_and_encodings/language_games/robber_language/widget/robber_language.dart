import 'package:flutter/material.dart';
import 'package:gc_wizard/common_widgets/base/gcw_textfield/gcw_textfield.dart';
import 'package:gc_wizard/common_widgets/gcw_default_output/gcw_default_output.dart';
import 'package:gc_wizard/common_widgets/gcw_twooptions_switch/gcw_twooptions_switch.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/robber_language/logic/robber_language.dart';

class RobberLanguage extends StatefulWidget {
  @override
  RobberLanguageState createState() => RobberLanguageState();
}

class RobberLanguageState extends State<RobberLanguage> {
  var _currentInput = '';
  var _currentMode = GCWSwitchPosition.right;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GCWTextField(onChanged: (text) {
          setState(() {
            _currentInput = text;
          });
        }),
        GCWTwoOptionsSwitch(
          value: _currentMode,
          onChanged: (value) {
            setState(() {
              _currentMode = value;
            });
          },
        ),
        GCWDefaultOutput(child: _buildOutput())
      ],
    );
  }

  _buildOutput() {
    if (_currentInput == null) return '';

    var out = _currentMode == GCWSwitchPosition.left
        ? encryptRobberLanguage(_currentInput)
        : decryptRobberLanguage(_currentInput);

    return out;
  }
}
