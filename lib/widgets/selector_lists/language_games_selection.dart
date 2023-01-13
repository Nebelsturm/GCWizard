import 'package:flutter/material.dart';
import 'package:gc_wizard/common_widgets/gcw_tool/gcw_tool.dart';
import 'package:gc_wizard/common_widgets/gcw_toollist/gcw_toollist.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/chicken_language/widget/chicken_language.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/duck_speak/widget/duck_speak.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/pig_latin/widget/pig_latin.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/robber_language/widget/robber_language.dart';
import 'package:gc_wizard/tools/crypto_and_encodings/language_games/spoon_language/widget/spoon_language.dart';
import 'package:gc_wizard/tools/utils/common_widget_utils/widget/common_widget_utils.dart';
import 'package:gc_wizard/widgets/registry.dart';
import 'package:gc_wizard/widgets/selector_lists/gcw_selection.dart';

class LanguageGamesSelection extends GCWSelection {
  @override
  Widget build(BuildContext context) {
    final List<GCWTool> _toolList = registeredTools.where((element) {
      return [
        className(ChickenLanguage()),
        className(DuckSpeak()),
        className(PigLatin()),
        className(RobberLanguage()),
        className(SpoonLanguage()),
      ].contains(className(element.tool));
    }).toList();

    _toolList.sort((a, b) => sortToolList(a, b));

    return Container(child: GCWToolList(toolList: _toolList));
  }
}
