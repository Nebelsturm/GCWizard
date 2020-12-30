import 'package:flutter/material.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/widgets/common/base/gcw_text.dart';
import 'package:gc_wizard/widgets/common/gcw_text_divider.dart';
import 'package:gc_wizard/widgets/main_menu/gcw_mainmenuentry_stub.dart';
import 'package:intl/intl.dart';

class Changelog extends StatefulWidget {
  @override
  ChangelogState createState() => ChangelogState();
}

class ChangelogState extends State<Changelog> {
  @override
  Widget build(BuildContext context) {
    var changelogs = {
      '1.3.0' : DateTime(2021, 01, 4),
      '1.2.0' : DateTime(2020, 11, 4),
      '1.1.0' : DateTime(2020, 9, 8),
      '1.0.0' : DateTime(2020, 7, 21),
      '0.8.1' : DateTime(2020, 6, 4),
      '0.8.0' : DateTime(2020, 5, 28),
      '0.7.1' : DateTime(2020, 4, 30),
      '0.7.0' : DateTime(2020, 4, 27),
      '0.6.2' : DateTime(2020, 4, 9),
      '0.6.1' : DateTime(2020, 4, 8),
      '0.6.0' : DateTime(2020, 4, 1),
      '0.5.1' : DateTime(2020, 3, 20),
      '0.5.0' : DateTime(2020, 3, 19),
      '0.4.0' : DateTime(2020, 3, 7),
      '0.3.2' : DateTime(2020, 2, 18),
      '0.3.0' : DateTime(2020, 1, 9),
      '0.0.4' : DateTime(2020, 1, 4),
      '0.0.1' : DateTime(2019, 12, 28)
    };

    var dateFormat = DateFormat('yMd', Localizations.localeOf(context).toString());

    var content = Column(
      children: changelogs.entries.map((changelog) {
        return Column(
          children: <Widget>[
            GCWTextDivider(
              text: '${changelog.key} (${dateFormat.format(changelog.value)})'
            ),
            GCWText(
              text: i18n(context, 'changelog_' + changelog.key)
            )
          ],
        );
      }).toList()
    );

    return GCWMainMenuEntryStub(
      content: content
    );
  }
}