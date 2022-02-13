import 'package:flutter/material.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/teletypewriter.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/telegraphs/punchtape.dart';
import 'package:gc_wizard/logic/tools/science_and_technology/numeral_bases.dart';
import 'package:gc_wizard/utils/common_utils.dart';
import 'package:gc_wizard/utils/constants.dart';
import 'package:gc_wizard/widgets/common/base/gcw_dropdownbutton.dart';
import 'package:gc_wizard/widgets/common/base/gcw_textfield.dart';
import 'package:gc_wizard/widgets/common/gcw_default_output.dart';
import 'package:gc_wizard/widgets/common/gcw_integer_list_textfield.dart';
import 'package:gc_wizard/widgets/common/gcw_twooptions_switch.dart';

class Z22 extends StatefulWidget {
  @override
  Z22State createState() => Z22State();
}

class Z22State extends State<Z22> {
  var _encodeController;
  var _decodeController;

  var _currentEncodeInput = '';
  var _currentDecodeInput = defaultIntegerListText;

  GCWSwitchPosition _currentMode = GCWSwitchPosition.right;
  GCWSwitchPosition _currentRadix = GCWSwitchPosition.left;

  var _currentCode = TeletypewriterCodebook.CCITT_ITA2_1931;

  @override
  void initState() {
    super.initState();

    _encodeController = TextEditingController(text: _currentEncodeInput);
    _decodeController = TextEditingController(text: _currentDecodeInput['text']);
  }

  @override
  void dispose() {
    _encodeController.dispose();
    _decodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _currentMode == GCWSwitchPosition.left
            ? GCWTextField(
          controller: _encodeController,
          onChanged: (text) {
            setState(() {
              _currentEncodeInput = text;
            });
          },
        )
            : GCWIntegerListTextField(
          controller: _decodeController,
          onChanged: (text) {
            setState(() {
              _currentDecodeInput = text;
            });
          },
        ),
        GCWTwoOptionsSwitch(
          value: _currentMode,
          onChanged: (value) {
            setState(() {
              _currentMode = value;
            });
          },
        ),
        GCWTwoOptionsSwitch(
          title: i18n(context, 'ccitt2_numeralbase'),
          leftValue: i18n(context, 'common_numeralbase_denary'),
          rightValue: i18n(context, 'common_numeralbase_binary'),
          value: _currentRadix,
          onChanged: (value) {
            setState(() {
              _currentRadix = value;
            });
          },
        ),
        GCWDefaultOutput(child: _buildOutput()),
      ],
    );
  }

  _buildOutput() {
    var output = '';

    if (_currentMode == GCWSwitchPosition.left) { // encrypt
      output = encodeTeletypewriter(_currentEncodeInput, _currentCode);
      if (_currentRadix == GCWSwitchPosition.right) { // binary
        output = output.split(' ').map((value) {
          var out = convertBase(value, 10, 2);
          return out.padLeft(5, '0');
        }).join(' ');
      }
      return output; // decimal
    } else { // decrypt
      if (_currentRadix == GCWSwitchPosition.right) { // binary
        return decodeTeletypewriter(
            textToBinaryList(_currentDecodeInput['text'])
                .map((value) {
              return int.tryParse(convertBase(value, 2, 10));
            }).toList(),
            _currentCode);
      }

      return decodeTeletypewriter(List<int>.from(_currentDecodeInput['values']), _currentCode); // decimal
    }
  }
}
