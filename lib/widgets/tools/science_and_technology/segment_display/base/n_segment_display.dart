import 'package:flutter/material.dart';
import 'package:gc_wizard/logic/tools/science_and_technology/segment_display.dart';
import 'package:gc_wizard/widgets/tools/science_and_technology/segment_display/base/painter.dart';
import 'package:touchable/touchable.dart';

class NSegmentDisplay extends StatefulWidget {
  final Map<String, bool> initialSegments;
  final SegmentDisplayType type;

  final Map<String, bool> segments;
  final bool readOnly;
  final Function onChanged;

  final Function customPaint;

  NSegmentDisplay(
      {Key key,
      this.initialSegments,
      this.type,
      this.segments,
      this.readOnly: false,
      this.onChanged,
      this.customPaint})
      : super(key: key);

  @override
  NSegmentDisplayState createState() => NSegmentDisplayState();
}

class NSegmentDisplayState extends State<NSegmentDisplay> {
  Map<String, bool> _segments;

  @override
  Widget build(BuildContext context) {
    if (widget.segments != null) {
      _segments = Map.from(widget.segments);
      widget.initialSegments.keys.forEach((segmentID) {
        if (_segments.containsKey(segmentID)) return;

        _segments.putIfAbsent(
            segmentID, () => widget.initialSegments[segmentID]);
      });
    } else {
      _segments = Map.from(widget.initialSegments);
    }

    return Row(
      children: <Widget>[
        widget.type == SegmentDisplayType.BABYLON
        ? Expanded(
            child: AspectRatio(
                aspectRatio: BABYLON_RELATIVE_DISPLAY_WIDTH / BABYLON_RELATIVE_DISPLAY_HEIGHT,
                child: CanvasTouchDetector(
                  builder: (context) {
                    return CustomPaint(
                        painter: SegmentDisplayPainter(
                            context, widget.type, _segments, (key, value) {
                      if (widget.readOnly) return;

                      setState(() {
                        _segments[key] = value;
                        widget.onChanged(_segments);
                      });
                    }, customPaint: widget.customPaint));
                  },
                )))
            : Expanded(
            child: AspectRatio(
                aspectRatio: SEGMENTS_RELATIVE_DISPLAY_WIDTH / SEGMENTS_RELATIVE_DISPLAY_HEIGHT,
                child: CanvasTouchDetector(
                  builder: (context) {
                    return CustomPaint(
                        painter: SegmentDisplayPainter(
                            context, widget.type, _segments, (key, value) {
                          if (widget.readOnly) return;

                          setState(() {
                            _segments[key] = value;
                            widget.onChanged(_segments);
                          });
                        }, customPaint: widget.customPaint));
                  },
                )))
      ],
    );
  }
}
