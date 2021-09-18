import 'package:flutter/material.dart';
import 'package:gc_wizard/logic/tools/science_and_technology/segment_display.dart';
import 'package:gc_wizard/widgets/common/gcw_touchcanvas.dart';
import 'package:gc_wizard/widgets/tools/science_and_technology/segment_display/base/n_segment_display.dart';
import 'package:gc_wizard/widgets/tools/science_and_technology/segment_display/base/painter.dart';

const _INITIAL_SEGMENTS = <String, bool>{
  '10': false, '20': false, '30': false, '40': false, '50': false, '60': false, '70': false, '80': false,
  '1l': false, '2l': false, '3l': false, '4l': false, '5l': false, '6l': false, '7l': false, '8l': false,
  '1r': false, '2r': false, '3r': false, '4r': false, '5r': false, '6r': false, '7r': false, '8r': false,
};

const _CHAPPE_RELATIVE_DISPLAY_WIDTH = 180;
const _CHAPPE_RELATIVE_DISPLAY_HEIGHT = 170;

class ChappeTelegraphSegmentDisplay extends NSegmentDisplay {
  final Map<String, bool> segments;
  final bool readOnly;
  final Function onChanged;

  ChappeTelegraphSegmentDisplay({Key key, this.segments, this.readOnly: false, this.onChanged})
      : super(
      key: key,
      initialSegments: _INITIAL_SEGMENTS,
      segments: segments,
      readOnly: readOnly,
      onChanged: onChanged,
      type: SegmentDisplayType.CUSTOM,
      customPaint: (GCWTouchCanvas canvas, Size size, Map<String, bool> currentSegments, Function setSegmentState, Color segment_color_on, Color segment_color_off) {
        var paint = defaultSegmentPaint();
        var SEGMENTS_COLOR_ON = segment_color_on;
        var SEGMENTS_COLOR_OFF = segment_color_off;

        canvas.touchCanvas.drawCircle(
            Offset(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85,
                size.height / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80 - 4),
            size.height / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 13.0,
            paint);

        var path00 = Path();
        path00.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 170);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 170);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 170);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 170);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 180);
        path00.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 180);
        path00.close();
        canvas.touchCanvas.drawPath(path00, paint);


        paint.color = currentSegments['10'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path10 = Path();
        path10.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path10.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path10.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 70, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path10.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 70, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path10.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path10.close();
        if (size.height < 180)
              if (currentSegments['10'])
                    canvas.touchCanvas.drawPath(path10, paint, onTapDown: (tapDetail) {setSegmentState('10', !currentSegments['10']);});
              else;
        else
              canvas.touchCanvas.drawPath(path10, paint, onTapDown: (tapDetail) {setSegmentState('10', !currentSegments['10']);});

        paint.color = currentSegments['1l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path1l = Path();
        path1l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path1l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path1l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 110);
        path1l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 110);
        path1l.close();
        if (size.height < 180)
              if (currentSegments['1l'])
                    canvas.touchCanvas.drawPath(path1l, paint, onTapDown: (tapDetail) {setSegmentState('1l', !currentSegments['1l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path1l, paint, onTapDown: (tapDetail) {setSegmentState('1l', !currentSegments['1l']);});

        paint.color = currentSegments['1r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path1r = Path();
        path1r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path1r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path1r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 20, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 60);
        path1r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 60);
        path1r.close();
        if (size.height < 180)
              if (currentSegments['1r'])
                    canvas.touchCanvas.drawPath(path1r, paint, onTapDown: (tapDetail) {setSegmentState('1r', !currentSegments['1r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path1r, paint, onTapDown: (tapDetail) {setSegmentState('1r', !currentSegments['1r']);});


        paint.color = currentSegments['20'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path20 = Path();
        path20.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path20.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 40, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path20.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 70);
        path20.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 70, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path20.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 40);
        path20.close();
        if (size.height < 180)
              if (currentSegments['20'])
                    canvas.touchCanvas.drawPath(path20, paint, onTapDown: (tapDetail) {setSegmentState('20', !currentSegments['20']);});
              else;
        else
              canvas.touchCanvas.drawPath(path20, paint, onTapDown: (tapDetail) {setSegmentState('20', !currentSegments['20']);});


        paint.color = currentSegments['2l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path2l = Path();
        path2l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 50);
        path2l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path2l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 40);
        path2l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 15, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 55);
        path2l.close();
        if (size.height < 180)
              if (currentSegments['2l'])
                    canvas.touchCanvas.drawPath(path2l, paint, onTapDown: (tapDetail) {setSegmentState('2l', !currentSegments['2l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path2l, paint, onTapDown: (tapDetail) {setSegmentState('2l', !currentSegments['2l']);});


        paint.color = currentSegments['2r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path2r = Path();
        path2r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path2r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 50, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path2r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 55, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 15);
        path2r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 40, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path2r.close();
        if (size.height < 180)
              if (currentSegments['2r'])
                    canvas.touchCanvas.drawPath(path2r, paint, onTapDown: (tapDetail) {setSegmentState('2r', !currentSegments['2r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path2r, paint, onTapDown: (tapDetail) {setSegmentState('2r', !currentSegments['2r']);});


        paint.color = currentSegments['30'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path30 = Path();
        path30.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path30.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path30.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 70);
        path30.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 70);
        path30.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path30.close();
        if (size.height < 180)
              if (currentSegments['30'])
                    canvas.touchCanvas.drawPath(path30, paint, onTapDown: (tapDetail) {setSegmentState('30', !currentSegments['30']);});
              else;
        else
              canvas.touchCanvas.drawPath(path30, paint, onTapDown: (tapDetail) {setSegmentState('30', !currentSegments['30']);});


        paint.color = currentSegments['3l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path3l = Path();
        path3l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 60, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path3l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path3l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path3l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 60, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path3l.close();
        if (size.height < 180)
              if (currentSegments['3l'])
                    canvas.touchCanvas.drawPath(path3l, paint, onTapDown: (tapDetail) {setSegmentState('3l', !currentSegments['3l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path3l, paint, onTapDown: (tapDetail) {setSegmentState('3l', !currentSegments['3l']);});


        paint.color = currentSegments['3r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path3r = Path();
        path3r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path3r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 110, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path3r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 110, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path3r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 20);
        path3r.close();
        if (size.height < 180)
              if (currentSegments['3r'])
                    canvas.touchCanvas.drawPath(path3r, paint, onTapDown: (tapDetail) {setSegmentState('3r', !currentSegments['3r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path3r, paint, onTapDown: (tapDetail) {setSegmentState('3r', !currentSegments['3r']);});


        paint.color = currentSegments['40'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path40 = Path();
        path40.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 70);
        path40.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 130, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path40.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path40.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 40);
        path40.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 100, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path40.close();
        if (size.height < 180)
              if (currentSegments['40'])
                    canvas.touchCanvas.drawPath(path40, paint, onTapDown: (tapDetail) {setSegmentState('40', !currentSegments['40']);});
              else;
        else
              canvas.touchCanvas.drawPath(path40, paint, onTapDown: (tapDetail) {setSegmentState('40', !currentSegments['40']);});


        paint.color = currentSegments['4l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path4l = Path();
        path4l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path4l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 120, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 10);
        path4l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 115, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 15);
        path4l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 130, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path4l.close();
        if (size.height < 180)
              if (currentSegments['4l'])
                    canvas.touchCanvas.drawPath(path4l, paint, onTapDown: (tapDetail) {setSegmentState('4l', !currentSegments['4l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path4l, paint, onTapDown: (tapDetail) {setSegmentState('4l', !currentSegments['4l']);});


        paint.color = currentSegments['4r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path4r = Path();
        path4r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 30);
        path4r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 50);
        path4r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 155, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 55);
        path4r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 40);
        path4r.close();
        if (size.height < 180)
              if (currentSegments['4r'])
                    canvas.touchCanvas.drawPath(path4r, paint, onTapDown: (tapDetail) {setSegmentState('4r', !currentSegments['4r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path4r, paint, onTapDown: (tapDetail) {setSegmentState('4r', !currentSegments['4r']);});


        paint.color = currentSegments['50'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path50 = Path();
        path50.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path50.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path50.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 100, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path50.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 100, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path50.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path50.close();
        if (size.height < 180)
              if (currentSegments['50'])
                    canvas.touchCanvas.drawPath(path50, paint, onTapDown: (tapDetail) {setSegmentState('50', !currentSegments['50']);});
              else;
        else
              canvas.touchCanvas.drawPath(path50, paint, onTapDown: (tapDetail) {setSegmentState('50', !currentSegments['50']);});


        paint.color = currentSegments['5l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path5l = Path();
        path5l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path5l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 80);
        path5l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 60);
        path5l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 60);
        path5l.close();
        if (size.height < 180)
              if (currentSegments['5l'])
                    canvas.touchCanvas.drawPath(path5l, paint, onTapDown: (tapDetail) {setSegmentState('5l', !currentSegments['5l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path5l, paint, onTapDown: (tapDetail) {setSegmentState('5l', !currentSegments['5l']);});


        paint.color = currentSegments['5r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path5r = Path();
        path5r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 85);
        path5r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 110);
        path5r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 110);
        path5r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 150, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path5r.close();
        if (size.height < 180)
              if (currentSegments['5r'])
                    canvas.touchCanvas.drawPath(path5r, paint, onTapDown: (tapDetail) {setSegmentState('5r', !currentSegments['5r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path5r, paint, onTapDown: (tapDetail) {setSegmentState('5r', !currentSegments['5r']);});


        paint.color = currentSegments['60'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path60 = Path();
        path60.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path60.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 100, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path60.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 130);
        path60.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path60.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 130, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path60.close();
        if (size.height < 180)
              if (currentSegments['60'])
                    canvas.touchCanvas.drawPath(path60, paint, onTapDown: (tapDetail) {setSegmentState('60', !currentSegments['60']);});
              else;
        else
              canvas.touchCanvas.drawPath(path60, paint, onTapDown: (tapDetail) {setSegmentState('60', !currentSegments['60']);});


        paint.color = currentSegments['6l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path6l = Path();
        path6l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path6l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 160, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 120);
        path6l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 155, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 115);
        path6l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 130);
        path6l.close();
        if (size.height < 180)
              if (currentSegments['6l'])
                    canvas.touchCanvas.drawPath(path6l, paint, onTapDown: (tapDetail) {setSegmentState('6l', !currentSegments['6l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path6l, paint, onTapDown: (tapDetail) {setSegmentState('6l', !currentSegments['6l']);});


        paint.color = currentSegments['6r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path6r = Path();
        path6r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 140, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path6r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 120, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path6r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 115, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 155);
        path6r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 130, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path6r.close();
        if (size.height < 180)
              if (currentSegments['6r'])
                    canvas.touchCanvas.drawPath(path6r, paint, onTapDown: (tapDetail) {setSegmentState('6r', !currentSegments['6r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path6r, paint, onTapDown: (tapDetail) {setSegmentState('6r', !currentSegments['6r']);});


        paint.color = currentSegments['70'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path70 = Path();
        path70.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path70.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path70.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path70.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path70.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path70.close();
        if (size.height < 180)
              if (currentSegments['70'])
                    canvas.touchCanvas.drawPath(path70, paint, onTapDown: (tapDetail) {setSegmentState('70', !currentSegments['70']);});
              else;
        else
              canvas.touchCanvas.drawPath(path70, paint, onTapDown: (tapDetail) {setSegmentState('70', !currentSegments['70']);});


        paint.color = currentSegments['7l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path7l = Path();
        path7l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 90, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path7l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 110, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path7l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 110, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path7l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path7l.close();
        if (size.height < 180)
              if (currentSegments['7l'])
                    canvas.touchCanvas.drawPath(path7l, paint, onTapDown: (tapDetail) {setSegmentState('7l', !currentSegments['7l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path7l, paint, onTapDown: (tapDetail) {setSegmentState('7l', !currentSegments['7l']);});


        paint.color = currentSegments['7r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path7r = Path();
        path7r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 85, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path7r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 60, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path7r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 60, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path7r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 150);
        path7r.close();
        if (size.height < 180)
              if (currentSegments['7r'])
                    canvas.touchCanvas.drawPath(path7r, paint, onTapDown: (tapDetail) {setSegmentState('7r', !currentSegments['7r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path7r, paint, onTapDown: (tapDetail) {setSegmentState('7r', !currentSegments['7r']);});


        paint.color = currentSegments['80'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path80 = Path();
        path80.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 70, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 90);
        path80.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 80, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 100);
        path80.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 40, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path80.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path80.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 130);
        path80.close();
        if (size.height < 180)
              if (currentSegments['80'])
                    canvas.touchCanvas.drawPath(path80, paint, onTapDown: (tapDetail) {setSegmentState('80', !currentSegments['80']);});
              else;
        else
              canvas.touchCanvas.drawPath(path80, paint, onTapDown: (tapDetail) {setSegmentState('80', !currentSegments['80']);});


        paint.color = currentSegments['8l'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path8l = Path();
        path8l.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path8l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 50, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 160);
        path8l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 55, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 155);
        path8l.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 40, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path8l.close();
        if (size.height < 180)
              if (currentSegments['8l'])
                    canvas.touchCanvas.drawPath(path8l, paint, onTapDown: (tapDetail) {setSegmentState('8l', !currentSegments['8l']);});
              else;
        else
              canvas.touchCanvas.drawPath(path8l, paint, onTapDown: (tapDetail) {setSegmentState('8l', !currentSegments['8l']);});

        paint.color = currentSegments['8r'] ? SEGMENTS_COLOR_ON : SEGMENTS_COLOR_OFF;
        var path8r = Path();
        path8r.moveTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 140);
        path8r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 10, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 120);
        path8r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 15, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 115);
        path8r.lineTo(size.width / _CHAPPE_RELATIVE_DISPLAY_WIDTH * 30, size.width / _CHAPPE_RELATIVE_DISPLAY_HEIGHT * 130);
        path8r.close();
        if (size.height < 180)
              if (currentSegments['8r'])
                    canvas.touchCanvas.drawPath(path8r, paint, onTapDown: (tapDetail) {setSegmentState('8r', !currentSegments['8r']);});
              else;
        else
              canvas.touchCanvas.drawPath(path8r, paint, onTapDown: (tapDetail) {setSegmentState('8r', !currentSegments['8r']);});



      });
}
