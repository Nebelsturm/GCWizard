import 'package:flutter/material.dart';
import 'package:gc_wizard/common_widgets/base/gcw_dropdownbutton/gcw_dropdownbutton.dart';
import 'package:gc_wizard/common_widgets/base/gcw_textfield/gcw_textfield.dart';
import 'package:gc_wizard/common_widgets/gcw_default_output/gcw_default_output.dart';
import 'package:gc_wizard/common_widgets/gcw_integer_list_textfield/gcw_integer_list_textfield.dart';
import 'package:gc_wizard/common_widgets/gcw_twooptions_switch/gcw_twooptions_switch.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/teletypewriter/logic/teletypewriter.dart';
import 'package:gc_wizard/tools/science_and_technology/numeral_bases/logic/numeral_bases.dart';
import 'package:gc_wizard/utils/logic_utils/common_utils.dart';
import 'package:gc_wizard/utils/logic_utils/constants.dart';

class Teletypewriter extends StatefulWidget {
  final TeletypewriterCodebook defaultCodebook;
  final Map<TeletypewriterCodebook, Map<String, String>> codebook;

  Teletypewriter({Key key, this.defaultCodebook, this.codebook}) : super(key: key);

  @override
  TeletypewriterState createState() => TeletypewriterState();
}

class TeletypewriterState extends State<Teletypewriter> {
  var _encodeController;
  var _decodeController;

  var _currentEncodeInput = '';
  var _currentDecodeInput = defaultIntegerListText;

  GCWSwitchPosition _currentMode = GCWSwitchPosition.right;
  GCWSwitchPosition _currentRadix = GCWSwitchPosition.left;

  var _currentCode;

  @override
  void initState() {
    super.initState();

    _currentCode = widget.defaultCodebook;
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
    if (widget.codebook == null) _currentCode = widget.defaultCodebook;

    return Column(
      children: <Widget>[
        if (widget.codebook != null)
          GCWDropDownButton(
            value: _currentCode,
            onChanged: (value) {
              setState(() {
                _currentCode = value;
              });
            },
            items: widget.codebook.entries.map((mode) {
              return GCWDropDownMenuItem(
                  value: mode.key,
                  child: i18n(context, mode.value['title']),
                  subtitle: mode.value['subtitle'] != null ? i18n(context, mode.value['subtitle']) : null);
            }).toList(),
          ),
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
    // these ancient codes are build from a picture showing the code in Bitorder 12345
    // all other codes are usually shown in Bitorder 54321
    // hence the binary representation should be mirrored
    bool mirrorBinary = false;
    if (_currentCode == TeletypewriterCodebook.BAUDOT_54123 ||
        _currentCode == TeletypewriterCodebook.BAUDOT ||
        _currentCode == TeletypewriterCodebook.MURRAY ||
        _currentCode == TeletypewriterCodebook.SIEMENS ||
        _currentCode == TeletypewriterCodebook.WESTERNUNION) mirrorBinary = true;

    if (_currentMode == GCWSwitchPosition.left) {
      // encrypt
      output = encodeTeletypewriter(_currentEncodeInput, _currentCode);
      if (_currentRadix == GCWSwitchPosition.right) {
        // binary
        output = output.split(' ').map((value) {
          var out = convertBase(value, 10, 2).padLeft(BINARY_LENGTH[_currentCode], '0');
          if (mirrorBinary) out = out.split('').reversed.join('');
          return out;
        }).join(' ');
      }
      return output; // decimal
    } else {
      // decrypt
      if (_currentRadix == GCWSwitchPosition.right) {
        // binary
        return decodeTeletypewriter(
          textToBinaryList(_currentDecodeInput['text']).map((value) {
            return int.tryParse(convertBase(value, 2, 10));
          }).toList(),
          _currentCode,
        );
      }

      return decodeTeletypewriter(List<int>.from(_currentDecodeInput['values']), _currentCode); // decimal
    }
  }
}
