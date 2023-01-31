import 'package:flutter/material.dart';
import 'package:gc_wizard/common/file_utils.dart';
import 'package:gc_wizard/common_widgets/dialogs/gcw_dialog.dart';
import 'package:gc_wizard/common_widgets/dialogs/gcw_exported_file_dialog.dart';
import 'package:gc_wizard/common_widgets/gcw_text_export.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/tools/coords/export/logic/gpx_kml_export.dart' as coordinatesExport;
import 'package:gc_wizard/tools/coords/map_view/logic/map_geometries.dart';

showCoordinatesExportDialog(BuildContext context, List<GCWMapPoint> points, List<GCWMapPolyline> polylines,
    {String json}) {
  const _MAX_QR_TEXT_LENGTH = 1000;

  showGCWDialog(context, i18n(context, 'coords_export_saved'), Text(i18n(context, 'coords_export_fileformat')), [
    json != null
        ? GCWDialogButton(
            text: 'JSON',
            onPressed: () async {
              var possibileExportMode =
                  json.length < _MAX_QR_TEXT_LENGTH ? PossibleExportMode.BOTH : PossibleExportMode.TEXTONLY;
              showGCWDialog(
                  context,
                  'JSON ' + i18n(context, 'common_text'),
                  GCWTextExport(text: json, initMode: TextExportMode.TEXT, possibileExportMode: possibileExportMode),
                  [GCWDialogButton(text: 'OK')],
                  cancelButton: false);
            },
          )
        : Container(),
    GCWDialogButton(
      text: 'GPX',
      onPressed: () async {
        coordinatesExport.exportCoordinates(context, points, polylines).then((value) {
          if (value != null) _showExportedFileDialog(context, FileType.GPX);
        });
      },
    ),
    GCWDialogButton(
      text: 'KML',
      onPressed: () async {
        coordinatesExport.exportCoordinates(context, points, polylines, kmlFormat: true).then((value) {
          if (value != null) _showExportedFileDialog(context, FileType.KML);
        });
      },
    )
  ]);
}

_showExportedFileDialog(BuildContext context, FileType type) {
  showExportedFileDialog(context, fileType: type);
}