import 'package:flutter/material.dart';
import 'package:gc_wizard/application/registry.dart';
import 'package:gc_wizard/application/selector_lists/gcw_selection.dart';
import 'package:gc_wizard/common_widgets/gcw_tool.dart';
import 'package:gc_wizard/common_widgets/gcw_toollist.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/tomtom/widget/tomtom.dart';
import 'package:gc_wizard/tools/symbol_tables/widget/symbol_table.dart';
import 'package:gc_wizard/utils/common_widget_utils.dart';

class TomTomSelection extends GCWSelection {
  @override
  Widget build(BuildContext context) {
    final List<GCWTool> _toolList = registeredTools.where((element) {
      if (className(element.tool) == className(SymbolTable()) && (element.tool as SymbolTable).symbolKey == 'tomtom')
        return true;

      return [
        className(TomTom()),
      ].contains(className(element.tool));
    }).toList();

    return Container(child: GCWToolList(toolList: _toolList));
  }
}