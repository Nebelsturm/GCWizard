import 'package:flutter/material.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/logic/tools/science_and_technology/summersimmer.dart';
import 'package:gc_wizard/logic/units/temperature.dart';
import 'package:gc_wizard/widgets/common/gcw_double_spinner.dart';
import 'package:gc_wizard/widgets/common/gcw_multiple_output.dart';
import 'package:gc_wizard/widgets/common/gcw_output.dart';
import 'package:gc_wizard/widgets/common/gcw_twooptions_switch.dart';

class SummersimmerIndex extends StatefulWidget {
  @override
  SummersimmerIndexState createState() => SummersimmerIndexState();
}

class SummersimmerIndexState extends State<SummersimmerIndex> {

  double _currentTemperature = 0.0;
  double _currentHumidity = 0.0;

  var _isMetric = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GCWDoubleSpinner(
            title: i18n(context, 'heatindex_temperature'),
            value: _currentTemperature,
            onChanged: (value) {
              setState(() {
                _currentTemperature = value;
              });
            }
        ),

        GCWTwoOptionsSwitch(
          title: i18n(context, 'heatindex_unit'),
          leftValue: i18n(context, 'heatindex_unit_celsius'),
          rightValue: i18n(context, 'heatindex_unit_fahrenheit'),
          value: _isMetric ? GCWSwitchPosition.left : GCWSwitchPosition.right,
          onChanged: (value) {
            setState(() {
              _isMetric = value == GCWSwitchPosition.left;
            });
          },
        ),

        GCWDoubleSpinner(
            title: i18n(context, 'heatindex_humidity'),
            value: _currentHumidity,
            min: 0.0,
            max: 100.0,
            onChanged: (value) {
              setState(() {
                _currentHumidity = value;
              });
            }
        ),
        _buildOutput(context)
      ],
    );
  }

  Widget _buildOutput(BuildContext context) {
    String unit = '';

    double output;
    if (_isMetric) {
      output = calculateSummersimmerIndex(_currentTemperature, _currentHumidity, TEMPERATURE_CELSIUS);
      unit = TEMPERATURE_CELSIUS.symbol;
    } else {
      output = calculateSummersimmerIndex(_currentTemperature, _currentHumidity, TEMPERATURE_FAHRENHEIT);
      unit = TEMPERATURE_FAHRENHEIT.symbol;
    }

    String hintT;
    if (
    (_isMetric && _currentTemperature < 27)
        || (!_isMetric && _currentTemperature < 80)
    ) {
      hintT = i18n(context, 'heatindex_hint_temperature', parameters: ['${_isMetric ? 18 : 64} $unit']);
    }

    String hintH;
    if (_currentHumidity < 40)
      hintH = i18n(context, 'heatindex_hint_humidity');

    var hint = [hintT, hintH].where((element) => element != null && element.length > 0).join('\n');

    String hintM;
    if (output > 51.7)
      hintM = 'heatindex_index_51.7';
    else
    if (output > 44.4)
      hintM = 'heatindex_index_44.4';
    else
    if (output > 37.8)
    hintM = 'summersimmerindex_index_37.8';
    else
    if (output > 32.8)
    hintM = 'summersimmerindex_index_32.8';
    else
    if (output > 28.3)
    hintM = 'summersimmerindex_index_28.3';
    else
    if (output > 25.0)
    hintM = 'summersimmerindex_index_25.0';
    else
    if (output > 21.3)
    hintM = 'summersimmerindex_index_21.3';

    var outputs = [
      GCWOutput(
        title: i18n(context, 'heatindex_output'),
        child: output.toStringAsFixed(3) + ' ' + unit,
      )
    ];

    if (hint != null && hint.length > 0)
      outputs.add(
          GCWOutput(
              title: i18n(context, 'heatindex_hint'),
              child: hint
          )
      );

    if (hintM != null && hintM.length > 0)
      outputs.add(
          GCWOutput(
              title: i18n(context, 'heatindex_meaning'),
              child: i18n(context, hintM)
          )
      );

    return GCWMultipleOutput(
      children: outputs,
    );
  }
}