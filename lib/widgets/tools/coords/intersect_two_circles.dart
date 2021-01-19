import 'package:flutter/material.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/logic/tools/coords/data/coordinates.dart';
import 'package:gc_wizard/logic/tools/coords/intersect_two_circles.dart';
import 'package:gc_wizard/logic/tools/coords/utils.dart';
import 'package:gc_wizard/theme/fixed_colors.dart';
import 'package:gc_wizard/widgets/common/gcw_distance.dart';
import 'package:gc_wizard/widgets/common/gcw_submit_button.dart';
import 'package:gc_wizard/widgets/tools/coords/base/gcw_coords.dart';
import 'package:gc_wizard/widgets/tools/coords/base/gcw_coords_output.dart';
import 'package:gc_wizard/widgets/tools/coords/base/gcw_coords_outputformat.dart';
import 'package:gc_wizard/widgets/tools/coords/map_view/gcw_map_geometries.dart';
import 'package:gc_wizard/widgets/tools/coords/base/utils.dart';

class IntersectTwoCircles extends StatefulWidget {
  @override
  IntersectTwoCirclesState createState() => IntersectTwoCirclesState();
}

class IntersectTwoCirclesState extends State<IntersectTwoCircles> {
  var _currentIntersections = [];

  var _currentCoordsFormat1 = defaultCoordFormat();
  var _currentCoords1 = defaultCoordinate;
  var _currentRadius1 = 0.0;

  var _currentCoordsFormat2 = defaultCoordFormat();
  var _currentCoords2 = defaultCoordinate;
  var _currentRadius2 = 0.0;

  var _currentOutputFormat = defaultCoordFormat();
  List<String> _currentOutput = [];
  var _currentMapPoints;

  @override
  void initState() {
    super.initState();
    _currentMapPoints = [
      GCWMapPoint(point: _currentCoords1),
      GCWMapPoint(point: _currentCoords2)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GCWCoords(
          title: i18n(context, "coords_intersectcircles_centerpoint1"),
          coordsFormat: _currentCoordsFormat1,
          onChanged: (ret) {
            setState(() {
              _currentCoordsFormat1 = ret['coordsFormat'];
              _currentCoords1 = ret['value'];
            });
          },
        ),
        GCWDistance(
          hintText: i18n(context, "common_radius"),
          onChanged: (value) {
            setState(() {
              _currentRadius1 = value;
            });
          },
        ),
        GCWCoords(
          title: i18n(context, "coords_intersectcircles_centerpoint2"),
          coordsFormat: _currentCoordsFormat2,
          onChanged: (ret) {
            setState(() {
              _currentCoordsFormat2 = ret['coordsFormat'];
              _currentCoords2 = ret['value'];
            });
          },
        ),
        GCWDistance(
          hintText: i18n(context, "common_radius"),
          onChanged: (value) {
            setState(() {
              _currentRadius2 = value;
            });
          },
        ),
        GCWCoordsOutputFormat(
          coordFormat: _currentOutputFormat,
          onChanged: (value) {
            setState(() {
              _currentOutputFormat = value;
            });
          },
        ),
        GCWSubmitButton(
          onPressed: () {
            setState(() {
              _calculateOutput();
            });
          },
        ),
        GCWCoordsOutput(
          outputs: _currentOutput,
          points: _currentMapPoints
        ),
      ],
    );
  }

  _calculateOutput() {
    _currentIntersections = intersectTwoCircles(_currentCoords1, _currentRadius1, _currentCoords2, _currentRadius2, defaultEllipsoid());

    _currentMapPoints = [
      GCWMapPoint(
        point: _currentCoords1,
        markerText: i18n(context, 'coords_intersectcircles_centerpoint1'),
        coordinateFormat: _currentCoordsFormat1,
        circleColorSameAsPointColor: false,
        circle: GCWMapCircle(
          radius: _currentRadius1,
          color: HSLColor
            .fromColor(COLOR_MAP_CIRCLE)
            .withLightness(HSLColor.fromColor(COLOR_MAP_CIRCLE).lightness - 0.3)
            .toColor()
        ),
      ),
      GCWMapPoint(
        point: _currentCoords2,
        markerText: i18n(context, 'coords_intersectcircles_centerpoint2'),
        coordinateFormat: _currentCoordsFormat1,
        circle: GCWMapCircle(
          radius: _currentRadius2,
          color: HSLColor
            .fromColor(COLOR_MAP_CIRCLE)
            .withLightness(HSLColor.fromColor(COLOR_MAP_CIRCLE).lightness - 0.3)
            .toColor()
        ),
      )
    ];

    if (_currentIntersections.isEmpty) {
      _currentOutput = [i18n(context, "coords_intersect_nointersection")];
      return;
    }

    _currentMapPoints.addAll(
      _currentIntersections
        .map((intersection) => GCWMapPoint(
          point: intersection,
          color: COLOR_MAP_CALCULATEDPOINT,
          markerText: i18n(context, 'coords_common_intersection'),
          coordinateFormat: _currentOutputFormat
        ))
        .toList()
    );

    _currentOutput = _currentIntersections
      .map((intersection) => formatCoordOutput(intersection, _currentOutputFormat, defaultEllipsoid()))
      .toList();
  }
}