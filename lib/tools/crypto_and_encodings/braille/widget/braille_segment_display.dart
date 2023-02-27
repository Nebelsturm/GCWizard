import 'package:flutter/material.dart';
import 'package:gc_wizard/application/theme/theme.dart';
import 'package:gc_wizard/common_widgets/gcw_touchcanvas.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/logic/segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/widget/n_segment_display.dart';
import 'package:gc_wizard/tools/science_and_technology/segment_display/_common/widget/segmentdisplay_painter.dart';

const _INITIAL_SEGMENTS = <String, bool>{
  '1': false,
  '4': false,
  '2': false,
  '5': false,
  '3': false,
  '6': false
};

const _BRAILLE_RELATIVE_DISPLAY_WIDTH = 50;
const _BRAILLE_RELATIVE_DISPLAY_HEIGHT = 100;
const _BRAILLE_RADIUS = 10.0;

//ignore: must_be_immutable
class BrailleSegmentDisplay extends NSegmentDisplay {
  final Map<String, bool> segments;
  final bool readOnly;
  final void Function(Map<String, bool>)? onChanged;

  BrailleSegmentDisplay({Key? key, required this.segments, this.readOnly = false, this.onChanged})
      : super(
            key: key,
            initialSegments: _INITIAL_SEGMENTS,
            segments: segments,
            readOnly: readOnly,
            onChanged: onChanged,
            type: SegmentDisplayType.CUSTOM,
            customPaint: (GCWTouchCanvas canvas,
                Size size,
                Map<String, bool> currentSegments,
                Function setSegmentState,
                Color segment_color_on,
                Color segment_color_off) {
              var paint = defaultSegmentPaint();
              var SEGMENTS_COLOR_ON = segment_color_on;
              var SEGMENTS_COLOR_OFF = segment_color_off;

              var circles = {
                '1': [15, 20],
                '2': [15, 50],
                '3': [15, 80],
                '4': [35, 20],
                '5': [35, 50],
                '6': [35, 80]
              };

              circles.forEach((key, value) {
                paint.color = segmentActive(currentSegments, key)
                    ? SEGMENTS_COLOR_ON
                    : SEGMENTS_COLOR_OFF;

                var pointSize = size.height /
                    _BRAILLE_RELATIVE_DISPLAY_HEIGHT *
                    _BRAILLE_RADIUS;

                canvas.touchCanvas.drawCircle(
                    Offset(
                        size.width / _BRAILLE_RELATIVE_DISPLAY_WIDTH * value[0],
                        size.height /
                            _BRAILLE_RELATIVE_DISPLAY_HEIGHT *
                            value[1]),
                    pointSize,
                    paint, onTapDown: (tapDetail) {
                  setSegmentState(key, !segmentActive(currentSegments, key));
                });

                if (size.height < 50) return;

                TextSpan span = TextSpan(
                    style: gcwTextStyle().copyWith(
                        color: Colors.white, fontSize: pointSize * 1.3),
                    text: key);
                TextPainter textPainter =
                    TextPainter(text: span, textDirection: TextDirection.ltr);
                textPainter.layout();

                textPainter.paint(
                    canvas.canvas,
                    Offset(
                        size.width /
                                _BRAILLE_RELATIVE_DISPLAY_WIDTH *
                                value[0] -
                            textPainter.width * 0.5,
                        size.height /
                                _BRAILLE_RELATIVE_DISPLAY_HEIGHT *
                                value[1] -
                            textPainter.height * 0.5));
              });
            });
}
