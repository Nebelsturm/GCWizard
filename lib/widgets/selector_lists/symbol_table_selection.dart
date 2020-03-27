import 'package:flutter/material.dart';
import 'package:gc_wizard/widgets/common/gcw_tool.dart';
import 'package:gc_wizard/widgets/common/gcw_toollist.dart';
import 'package:gc_wizard/widgets/registry.dart';
import 'package:gc_wizard/widgets/selector_lists/gcw_selection.dart';
import 'package:gc_wizard/widgets/tools/crypto/symbol_table.dart';
import 'package:gc_wizard/widgets/tools/encodings/base/base16.dart';
import 'package:gc_wizard/widgets/tools/encodings/base/base32.dart';
import 'package:gc_wizard/widgets/tools/encodings/base/base64.dart';
import 'package:gc_wizard/widgets/tools/encodings/base/base85.dart';
import 'package:gc_wizard/widgets/utils/common_widget_utils.dart';

class SymbolTableSelection extends GCWSelection {
  @override
  Widget build(BuildContext context) {

    List<GCWToolWidget> _toolList =
      Registry.toolList.where((element) {
        return [
          className(SymbolTable()),
        ].contains(className(element.tool));
      }).toList();

    _toolList.sort((a, b){
      return a.toolName.toLowerCase().compareTo(b.toolName.toLowerCase());
    });

    return Container(
      child: GCWToolList(
        toolList: _toolList
      )
    );
  }
}