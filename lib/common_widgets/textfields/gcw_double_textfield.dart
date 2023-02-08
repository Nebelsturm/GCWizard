import 'package:flutter/material.dart';
import 'package:gc_wizard/common_widgets/text_input_formatters/gcw_double_textinputformatter.dart';
import 'package:gc_wizard/common_widgets/textfields/gcw_textfield.dart';

class GCWDoubleTextField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(Map<String, dynamic>) onChanged;
  final GCWDoubleTextInputFormatter? textInputFormatter;
  final String? hintText;
  final double? min;
  final double? max;
  final FocusNode? focusNode;
  final int? numberDecimalDigits;

  const GCWDoubleTextField(
      {Key? key,
      required this.onChanged,
      this.controller,
      this.textInputFormatter,
      this.hintText,
      this.min,
      this.max,
      this.focusNode,
      this.numberDecimalDigits})
      : super(key: key);

  @override
  _GCWDoubleTextFieldState createState() => _GCWDoubleTextFieldState();
}

class _GCWDoubleTextFieldState extends State<GCWDoubleTextField> {
  var _doubleInputFormatter;

  @override
  void initState() {
    super.initState();

    _doubleInputFormatter =
        GCWDoubleTextInputFormatter(min: widget.min, max: widget.max, numberDecimalDigits: widget.numberDecimalDigits);
  }

  @override
  Widget build(BuildContext context) {
    return GCWTextField(
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      onChanged: (text) {
        setState(() {
          double _value; //Mark nullable ?

          text = text.replaceFirst(',', '.');

          if (['', '-', '.'].contains(text)) {
            _value = 0.0;
          } else {
            _value = double.tryParse(text);
          }

          if (widget.min != null && _value < widget.min!) _value = widget.min!;

          if (widget.max != null && _value > widget.max!) _value = widget.max!;

          widget.onChanged({'text': text, 'value': _value});
        });
      },
      controller: widget.controller,
      inputFormatters: [widget.textInputFormatter ?? _doubleInputFormatter],
      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
    );
  }
}
