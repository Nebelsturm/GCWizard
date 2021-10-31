import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/telegraphs/ccitt.dart';
import 'package:gc_wizard/theme/theme.dart';
import 'package:gc_wizard/widgets/common/base/gcw_dropdownbutton.dart';
import 'package:gc_wizard/widgets/common/base/gcw_iconbutton.dart';
import 'package:gc_wizard/widgets/common/base/gcw_textfield.dart';
import 'package:gc_wizard/widgets/common/gcw_default_output.dart';
import 'package:gc_wizard/widgets/common/gcw_segmentdisplay_output.dart';
import 'package:gc_wizard/widgets/common/gcw_output.dart';
import 'package:gc_wizard/widgets/common/gcw_toolbar.dart';
import 'package:gc_wizard/widgets/common/gcw_twooptions_switch.dart';
import 'package:gc_wizard/widgets/tools/crypto_and_encodings/telegraphs/ccitt_segment_display.dart';

class CCITTTelegraph extends StatefulWidget {
  @override
  CCITTTelegraphState createState() => CCITTTelegraphState();
}

class CCITTTelegraphState extends State<CCITTTelegraph> {
  String _currentEncodeInput = '';
  TextEditingController _encodeController;

  var _DecodeInputController;
  var _currentDecodeInput = '';

  List<List<String>> _currentDisplays = [];
  var _currentMode = GCWSwitchPosition.right;
  var _currentDecodeMode = GCWSwitchPosition.right; // text - visual

  var _currentLanguage = CCITTCodebook.CCITT1;

  @override
  void initState() {
    super.initState();
    _encodeController = TextEditingController(text: _currentEncodeInput);
    _DecodeInputController = TextEditingController(text: _currentDecodeInput);
  }

  @override
  void dispose() {
    _encodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GCWDropDownButton(
        value: _currentLanguage,
        onChanged: (value) {
          setState(() {
            _currentLanguage = value;
          });
        },
        items: CCITT_CODEBOOK.entries.map((mode) {
          return GCWDropDownMenuItem(
              value: mode.key,
              child: i18n(context, mode.value['title']),
              subtitle: mode.value['subtitle'] != null ? i18n(context, mode.value['subtitle']) : null
          );
        }).toList(),
      ),
      GCWTwoOptionsSwitch(
        value: _currentMode,
        onChanged: (value) {
          setState(() {
            _currentMode = value;
          });
        },
      ),
      if (_currentMode == GCWSwitchPosition.left) // encrypt: input number => output segment
        GCWTextField(
          controller: _encodeController,
          onChanged: (text) {
            setState(() {
              _currentEncodeInput = text;
            });
          },
        )
      else
        Column(
          // decrpyt: input segment => output number
          children: <Widget>[
            GCWTwoOptionsSwitch(
              value: _currentDecodeMode,
              leftValue: i18n(context, 'telegraph_decode_textmode'),
              rightValue: i18n(context, 'telegraph_decode_visualmode'),
              onChanged: (value) {
                setState(() {
                  _currentDecodeMode = value;
                });
              },
            ),
            if (_currentDecodeMode == GCWSwitchPosition.right) // visual mode
              _buildVisualDecryption()
            else // decode text
              GCWTextField(
                controller: _DecodeInputController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[ 01]')),],
                onChanged: (text) {
                  setState(() {
                    _currentDecodeInput = text;
                  });
                },
              )
          ],
        ),
      _buildOutput()
    ]);
  }

  _buildVisualDecryption() {
    Map<String, bool> currentDisplay;

    var displays = _currentDisplays;
    if (displays != null && displays.length > 0)
      currentDisplay = Map<String, bool>.fromIterable(displays.last ?? [], key: (e) => e, value: (e) => true);
    else
      currentDisplay = {};

    var onChanged = (Map<String, bool> d) {
      setState(() {
        var newSegments = <String>[];
        d.forEach((key, value) {
          if (!value) return;
          newSegments.add(key);
        });

        newSegments.sort();

        if (_currentDisplays.length == 0) _currentDisplays.add([]);

        _currentDisplays[_currentDisplays.length - 1] = newSegments;
      });
    };

    return Column(
      children: <Widget>[
        Container(
          width: 200,
          height: 60,
          padding: EdgeInsets.only(top: DEFAULT_MARGIN * 2, bottom: DEFAULT_MARGIN * 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: CCITTSegmentDisplay(
                  segments: currentDisplay,
                  onChanged: onChanged,
                ),
              )
            ],
          ),
        ),
        GCWToolBar(children: [
          GCWIconButton(
            iconData: Icons.space_bar,
            onPressed: () {
              setState(() {
                _currentDisplays.add([]);
              });
            },
          ),
          GCWIconButton(
            iconData: Icons.backspace,
            onPressed: () {
              setState(() {
                if (_currentDisplays.length > 0) _currentDisplays.removeLast();
              });
            },
          ),
          GCWIconButton(
            iconData: Icons.clear,
            onPressed: () {
              setState(() {
                _currentDisplays = [];
              });
            },
          )
        ])
      ],
    );
  }

  Widget _buildDigitalOutput(List<List<String>> segments) {
    return GCWSegmentDisplayOutput(
        tapeStyle: true,
        segmentFunction:(displayedSegments, readOnly) {
          return CCITTSegmentDisplay(segments: displayedSegments, readOnly: readOnly);
        },
        segments: segments,
        readOnly: true
    );
  }

  Widget _buildOutput() {
    if (_currentMode == GCWSwitchPosition.left) { //encode
      List<List<String>> segments = encodeCCITT(_currentEncodeInput, _currentLanguage);
      return Column(
        children: <Widget>[
          _buildDigitalOutput(segments),
        ],
      );
    } else { //decode
      var segments;
      if (_currentDecodeMode == GCWSwitchPosition.left){ // text
        segments = decodeTextCCITTTelegraph(_currentDecodeInput.toUpperCase(), _currentLanguage);
      } else { // visual
        var output = _currentDisplays.map((character) {
          if (character != null) return character.join();
        }).toList();
        segments = decodeVisualCCITT(output, _currentLanguage);
      }
      return Column(
        children: <Widget>[
          _buildDigitalOutput(segments['displays']),
          GCWDefaultOutput(child: segments['text']),
        ],
      );
    }
  }
}
