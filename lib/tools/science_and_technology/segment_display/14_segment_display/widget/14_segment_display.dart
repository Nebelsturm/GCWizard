import 'package:flutter/material.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/logic/segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/widget/n_segment_display.dart';

const _INITIAL_SEGMENTS = <String, bool>{
  'a': false,
  'b': false,
  'c': false,
  'd': false,
  'e': false,
  'f': false,
  'g1': false,
  'g2': false,
  'h': false,
  'i': false,
  'j': false,
  'k': false,
  'l': false,
  'm': false,
  'dp': false
};

class FourteenSegmentDisplay extends NSegmentDisplay {
  final Map<String, bool> segments;
  final bool readOnly;
  final void Function(Map<String, bool>)? onChanged;
  final bool tapeStyle;

  FourteenSegmentDisplay({
    Key? key,
    required this.segments,
    this.readOnly = false,
    this.onChanged,
    this.tapeStyle = false})
      : super(
            key: key,
            initialSegments: _INITIAL_SEGMENTS,
            segments: segments,
            readOnly: readOnly,
            onChanged: onChanged,
            type: SegmentDisplayType.FOURTEEN);
}
