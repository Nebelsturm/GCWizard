part of 'package:gc_wizard/tools/science_and_technology/telegraphs/semaphore/widget/semaphore.dart';

const _INITIAL_SEGMENTS = <String, bool>{
  'l1': false,
  'l2': false,
  'l3': false,
  'l4': false,
  'l5': false,
  'r1': false,
  'r2': false,
  'r3': false,
  'r4': false,
  'r5': false
};

const _SEMAPHORE_RELATIVE_DISPLAY_WIDTH = 360; //110;
const _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT = 260; //100;


class _SemaphoreSegmentDisplay extends NSegmentDisplay {

  _SemaphoreSegmentDisplay({
      Key? key,
      required Map<String, bool> segments,
      bool readOnly = false,
      void Function(Map<String, bool>)? onChanged})
      : super(
            key: key,
            initialSegments: _INITIAL_SEGMENTS,
            segments: segments,
            readOnly: readOnly,
            onChanged: onChanged,
            type: SegmentDisplayType.CUSTOM,
            customPaint: (GCWTouchCanvas canvas, Size size, Map<String, bool> currentSegments, Function setSegmentState,
                Color segment_color_on, Color segment_color_off) {
              var paint = defaultSegmentPaint();
              var SEGMENTS_COLOR_ON = segment_color_on;
              var SEGMENTS_COLOR_OFF = segment_color_off;

              paint.color = Colors.grey;
              canvas.touchCanvas.drawCircle(
                  Offset(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 185,
                      size.height / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 55),
                  size.height / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 25.0,
                  paint);

              canvas.touchCanvas.drawCircle(
                  Offset(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 185,
                      size.height / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120),
                  size.height / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 35.0,
                  paint);

              paint.color = segmentActive(currentSegments, 'l1') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathL1 = Path();
              pathL1.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 90,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 10);
              pathL1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 140,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 10);
              pathL1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 140,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathL1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathL1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 60);
              pathL1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 90,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 60);
              pathL1.close();

              if (!readOnly || segmentActive(currentSegments, 'l1')) {
                canvas.touchCanvas.drawPath(pathL1, paint, onTapDown: (tapDetail) {
                  setSegmentState('l1', !segmentActive(currentSegments, 'l1'));
                  if (segmentActive(currentSegments, 'l1')) {
                    setSegmentState('l2', false);
                    setSegmentState('l3', false);
                    setSegmentState('l4', false);
                    setSegmentState('l5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'r1') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathR1 = Path();
              pathR1.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 280,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 10);
              pathR1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 230,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 10);
              pathR1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 230,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathR1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathR1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 60);
              pathR1.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 280,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 60);
              pathR1.close();

              if (!readOnly || segmentActive(currentSegments, 'r1')) {
                canvas.touchCanvas.drawPath(pathR1, paint, onTapDown: (tapDetail) {
                  setSegmentState('r1', !segmentActive(currentSegments, 'r1'));
                  if (segmentActive(currentSegments, 'r1')) {
                    setSegmentState('r2', false);
                    setSegmentState('r3', false);
                    setSegmentState('r4', false);
                    setSegmentState('r5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'l2') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathL2 = Path();
              pathL2.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 50,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 40);
              pathL2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathL2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 120,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathL2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 80,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 90);
              pathL2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 50,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathL2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 10,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 80);
              pathL2.close();

              if (!readOnly || segmentActive(currentSegments, 'l2')) {
                canvas.touchCanvas.drawPath(pathL2, paint, onTapDown: (tapDetail) {
                  setSegmentState('l2', !segmentActive(currentSegments, 'l2'));
                  if (segmentActive(currentSegments, 'l2')) {
                    setSegmentState('l1', false);
                    //setSegmentState('l3', false);
                    //setSegmentState('l4', false);
                    setSegmentState('l5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'r2') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathR2 = Path();
              pathR2.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathR2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 320,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 40);
              pathR2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 360,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 80);
              pathR2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 320,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 120);
              pathR2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 290,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 90);
              pathR2.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 250,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathR2.close();

              if (!readOnly || segmentActive(currentSegments, 'r2')) {
                canvas.touchCanvas.drawPath(pathR2, paint, onTapDown: (tapDetail) {
                  setSegmentState('r2', !segmentActive(currentSegments, 'r2'));
                  if (segmentActive(currentSegments, 'r2')) {
                    setSegmentState('r1', false);
                    //setSegmentState('r3', false);
                    //setSegmentState('r4', false);
                    setSegmentState('r5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'l3') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathL3 = Path();
              pathL3.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 10,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathL3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 120,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathL3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 120,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathL3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 60,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathL3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 60,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 180);
              pathL3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 10,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 180);
              pathL3.close();

              if (!readOnly || segmentActive(currentSegments, 'l3')) {
                canvas.touchCanvas.drawPath(pathL3, paint, onTapDown: (tapDetail) {
                  setSegmentState('l3', !segmentActive(currentSegments, 'l3'));
                  if (segmentActive(currentSegments, 'l3')) {
                    //setSegmentState('l2', false);
                    setSegmentState('l1', false);
                    //setSegmentState('l4', false);
                    setSegmentState('l5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'r3') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathR3 = Path();
              pathR3.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 250,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathR3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 360,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 130);
              pathR3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 360,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 180);
              pathR3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 310,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 180);
              pathR3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 310,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathR3.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 250,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathR3.close();

              if (!readOnly || segmentActive(currentSegments, 'r3')) {
                canvas.touchCanvas.drawPath(pathR3, paint, onTapDown: (tapDetail) {
                  setSegmentState('r3', !segmentActive(currentSegments, 'r3'));
                  if (segmentActive(currentSegments, 'r3')) {
                    //setSegmentState('r2', false);
                    setSegmentState('r1', false);
                    //setSegmentState('r4', false);
                    setSegmentState('r5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'l4') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathL4 = Path();
              pathL4.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 40,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 220);
              pathL4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 120,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathL4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathL4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 90,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 190);
              pathL4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 120,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 220);
              pathL4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 80,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathL4.close();

              if (!readOnly || segmentActive(currentSegments, 'l4')) {
                canvas.touchCanvas.drawPath(pathL4, paint, onTapDown: (tapDetail) {
                  setSegmentState('l4', !segmentActive(currentSegments, 'l4'));
                  if (segmentActive(currentSegments, 'l4')) {
                    //setSegmentState('l2', false);
                    //setSegmentState('l3', false);
                    setSegmentState('l1', false);
                    setSegmentState('l5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'r4') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathR4 = Path();
              pathR4.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathR4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 250,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 140);
              pathR4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 330,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 220);
              pathR4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 290,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathR4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 250,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 220);
              pathR4.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 280,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 190);
              pathR4.close();

              if (!readOnly || segmentActive(currentSegments, 'r4')) {
                canvas.touchCanvas.drawPath(pathR4, paint, onTapDown: (tapDetail) {
                  setSegmentState('r4', !segmentActive(currentSegments, 'r4'));
                  if (segmentActive(currentSegments, 'r4')) {
                    //setSegmentState('r2', false);
                    //setSegmentState('r3', false);
                    setSegmentState('r1', false);
                    setSegmentState('r5', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'l5') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathL5 = Path();
              pathL5.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathL5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 140,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathL5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 140,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 210);
              pathL5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 180,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 210);
              pathL5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 180,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathL5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 130,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathL5.close();

              if (!readOnly || segmentActive(currentSegments, 'l5')) {
                canvas.touchCanvas.drawPath(pathL5, paint, onTapDown: (tapDetail) {
                  setSegmentState('l5', !segmentActive(currentSegments, 'l5'));
                  if (segmentActive(currentSegments, 'l5')) {
                    setSegmentState('l2', false);
                    setSegmentState('l3', false);
                    setSegmentState('l4', false);
                    setSegmentState('l1', false);
                  }
                });
              }

              paint.color = segmentActive(currentSegments, 'r5') ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
              var pathR5 = Path();
              pathR5.moveTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 230,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathR5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 150);
              pathR5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 240,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathR5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 190,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 260);
              pathR5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 190,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 210);
              pathR5.lineTo(size.width / _SEMAPHORE_RELATIVE_DISPLAY_WIDTH * 230,
                  size.width / _SEMAPHORE_RELATIVE_DISPLAY_HEIGHT * 210);
              pathR5.close();

              if (!readOnly || segmentActive(currentSegments, 'r5')) {
                canvas.touchCanvas.drawPath(pathR5, paint, onTapDown: (tapDetail) {
                  setSegmentState('r5', !segmentActive(currentSegments, 'r5'));
                  if (segmentActive(currentSegments, 'r5')) {
                    setSegmentState('r2', false);
                    setSegmentState('r3', false);
                    setSegmentState('r4', false);
                    setSegmentState('r1', false);
                  }
                });
              }
            });
}
