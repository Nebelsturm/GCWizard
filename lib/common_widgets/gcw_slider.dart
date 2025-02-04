import 'package:flutter/material.dart';
import 'package:gc_wizard/application/theme/theme_colors.dart';
import 'package:gc_wizard/common_widgets/buttons/gcw_iconbutton.dart';
import 'package:gc_wizard/common_widgets/gcw_text.dart';

class GCWSlider extends StatefulWidget {
  final String title;
  final void Function(double) onChanged;
  final void Function(double)? onChangeEnd;
  final double value;
  final double min;
  final double max;
  final bool suppressReset;

  const GCWSlider(
      {Key? key,
      required this.title,
      required this.value,
      required this.onChanged,
      this.onChangeEnd,
      required this.min,
      required this.max,
      this.suppressReset = false})
      : super(key: key);

  @override
  _GCWSliderState createState() => _GCWSliderState();
}

class _GCWSliderState extends State<GCWSlider> {
  late double _currentValue;

  late double _initialValue;

  @override
  void initState() {
    super.initState();

    _initialValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.title.isNotEmpty) Expanded(child: GCWText(text: widget.title + ':')),
        Expanded(
          flex: 3,
          child: Slider(
            value: widget.value,
            min: widget.min,
            max: widget.max,
            onChanged: (value) {
              setState(() {
                _currentValue = value;
                widget.onChanged(_currentValue);
              });
            },
            onChangeEnd: (value) {
              setState(() {
                if (widget.onChangeEnd != null) widget.onChangeEnd!(_currentValue);
              });
            },
            activeColor: themeColors().switchThumb2(),
            inactiveColor: themeColors().switchTrack2(),
          ),
        ),
        if (!widget.suppressReset)
          GCWIconButton(
            icon: Icons.refresh,
            size: IconButtonSize.SMALL,
            onPressed: () {
              setState(() {
                _currentValue = _initialValue;
                widget.onChanged(_currentValue);
                if (widget.onChangeEnd != null) widget.onChangeEnd!(_currentValue);
              });
            },
          )
      ],
    );
  }
}
