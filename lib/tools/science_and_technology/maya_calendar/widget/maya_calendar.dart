import 'package:flutter/material.dart';
import 'package:gc_wizard/application/i18n/app_localizations.dart';
import 'package:gc_wizard/application/theme/theme.dart';
import 'package:gc_wizard/common_widgets/buttons/gcw_iconbutton.dart';
import 'package:gc_wizard/common_widgets/gcw_toolbar.dart';
import 'package:gc_wizard/common_widgets/outputs/gcw_columned_multiline_output.dart';
import 'package:gc_wizard/common_widgets/spinners/gcw_integer_spinner.dart';
import 'package:gc_wizard/common_widgets/switches/gcw_twooptions_switch.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/maya_numbers/widget/maya_numbers_segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/maya_calendar/logic/maya_calendar.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/logic/segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/widget/n_segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/widget/segmentdisplay_output.dart';
import 'package:intl/intl.dart';

class MayaCalendar extends StatefulWidget {
  @override
  MayaCalendarState createState() => MayaCalendarState();
}

class MayaCalendarState extends State<MayaCalendar> {
  var _currentEncodeInput = 0;
  var _currentLongCount = '';
  var _longCountController;

  var _currentDisplays = Segments.Empty();
  var _currentMode = GCWSwitchPosition.right;

  @override
  void initState() {
    super.initState();
    _longCountController = TextEditingController(text: _currentLongCount);
  }

  @override
  void dispose() {
    _longCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GCWTwoOptionsSwitch(
        value: _currentMode,
        onChanged: (value) {
          setState(() {
            _currentMode = value;
          });
        },
      ),
      _currentMode == GCWSwitchPosition.left // encrypt: input number => output segment
          ? GCWIntegerSpinner(
              overflow: SpinnerOverflowType.SUPPRESS_OVERFLOW,
              min: 0,
              value: _currentEncodeInput,
              onChanged: (value) {
                setState(() {
                  _currentEncodeInput = value;
                });
              },
            )
          : Column(
              // decrpyt: input segment => output number
              children: <Widget>[_buildVisualDecryption()],
            ),
      _buildOutput()
    ]);
  }

  Widget _buildVisualDecryption() {
    var currentDisplay = buildSegmentMap(_currentDisplays);

    var onChanged = (Map<String, bool> d) {
      setState(() {
        var newSegments = <String>[];
        d.forEach((key, value) {
          if (!value) return;
          newSegments.add(key);
        });

        _currentDisplays.replaceLastSegment(newSegments);
      });
    };

    return Column(
      children: <Widget>[
        Container(
          width: 180,
          padding: EdgeInsets.only(top: DEFAULT_MARGIN * 2, bottom: DEFAULT_MARGIN * 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MayaNumbersSegmentDisplay(
                  segments: currentDisplay,
                  onChanged: onChanged,
                ),
              )
            ],
          ),
        ),
        GCWToolBar(children: [
          GCWIconButton(
            icon: Icons.space_bar,
            onPressed: () {
              setState(() {
                _currentDisplays.addEmptyElement();
              });
            },
          ),
          GCWIconButton(
            icon: Icons.backspace,
            onPressed: () {
              setState(() {
                _currentDisplays.removeLastSegment();
              });
            },
          ),
          GCWIconButton(
            icon: Icons.clear,
            onPressed: () {
              setState(() {
                _currentDisplays = Segments.Empty()
              });
            },
          )
        ])
      ],
    );
  }

  Widget _buildDigitalOutput(List<List<String>> segments) {
    return SegmentDisplayOutput(
        segmentFunction: (displayedSegments, readOnly) {
          return MayaNumbersSegmentDisplay(segments: displayedSegments, readOnly: readOnly);
        },
        segments: segments,
        readOnly: true);
  }

  Widget _buildOutput() {
    Map outputDates = new Map();
    var dateFormat = DateFormat('yMMMMd', Localizations.localeOf(context).toString());

    if (_currentMode == GCWSwitchPosition.left) {
      //encode
      var segments = encodeMayaCalendar(_currentEncodeInput);
      var numbers = segments['numbers'] as List<int>;
      var displays = segments['displays'] as List<List<String>>;
      var gregorian = MayaDayCountToGregorianCalendar(MayaLongCountToMayaDayCount(numbers));
      var julian = MayaDayCountToJulianCalendar(MayaLongCountToMayaDayCount(numbers));

      outputDates[i18n(context, 'mayacalendar_system_longcount')] = MayaLongCount(numbers) +
          '\n' +
          MayaLongCountToTzolkin(numbers) +
          '   ' +
          MayaLongCountToHaab(numbers);
      outputDates[i18n(context, 'mayacalendar_juliandate')] = MayaDayCountToJulianDate(MayaLongCountToMayaDayCount(numbers));
      outputDates[i18n(context, 'mayacalendar_gregoriancalendar')] = dateFormat.format(gregorian);
      outputDates[i18n(context, 'mayacalendar_juliancalendar')] = dateFormat.format(julian);

      return Column(
        children: <Widget>[
          _buildDigitalOutput(displays),
          GCWColumnedMultilineOutput(
            data: outputDates.entries.map((entry) {
                    return [entry.key, entry.value];
                  }).toList(),
            flexValues: [1, 1]
          ),
        ],
      );
    } else {
      //decode
      var output = _currentDisplays.map((character) {
        if (character != null) return character.join();
      }).toList();
      var segments = decodeMayaCalendar(output);
      var numbers = segments['numbers'] as List<int>;
      var displays = segments['displays'] as List<List<String>>;
      var vigesimal = segments['vigesimal'] as int;
      var gregorian = MayaDayCountToGregorianCalendar(vigesimal);
      var julian = MayaDayCountToJulianCalendar(vigesimal);

      outputDates[i18n(context, 'mayacalendar_daycount')] = vigesimal;
      outputDates[i18n(context, 'mayacalendar_system_longcount')] = MayaLongCount(numbers) +
          '\n' +
          MayaLongCountToTzolkin(numbers) +
          '   ' +
          MayaLongCountToHaab(numbers);
      outputDates[i18n(context, 'mayacalendar_juliandate')] = MayaDayCountToJulianDate(vigesimal);
      outputDates[i18n(context, 'mayacalendar_gregoriancalendar')] = dateFormat.format(gregorian);
      outputDates[i18n(context, 'mayacalendar_juliancalendar')] = dateFormat.format(julian);
      return Column(
        children: <Widget>[
          _buildDigitalOutput(displays),
          GCWColumnedMultilineOutput(
            data: outputDates.entries.map((entry) {
                    return [entry.key, entry.value];
                  }).toList(),
            flexValues: [1, 1]
          ),
        ],
      );
    }
  }
}
