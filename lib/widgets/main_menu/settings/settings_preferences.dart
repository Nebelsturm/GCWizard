import 'package:flutter/material.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/theme/theme.dart';
import 'package:gc_wizard/theme/theme_colors.dart';
import 'package:gc_wizard/utils/default_settings.dart';
import 'package:gc_wizard/widgets/common/base/gcw_button.dart';
import 'package:gc_wizard/widgets/common/base/gcw_dialog.dart';
import 'package:gc_wizard/widgets/common/base/gcw_iconbutton.dart';
import 'package:gc_wizard/widgets/common/base/gcw_text.dart';
import 'package:gc_wizard/widgets/common/base/gcw_textfield.dart';
import 'package:gc_wizard/widgets/common/gcw_double_spinner.dart';
import 'package:gc_wizard/widgets/common/gcw_integer_spinner.dart';
import 'package:gc_wizard/widgets/common/gcw_onoff_switch.dart';
import 'package:gc_wizard/widgets/common/gcw_text_divider.dart';
import 'package:gc_wizard/widgets/utils/common_widget_utils.dart';
import 'package:prefs/prefs.dart';

const _PREF_VALUE_MAX_LENGTH = 300;
enum _PrefType {STRING, STRINGLIST, OBJECTLIST, INT, DOUBLE, BOOL}

class SettingsPreferences extends StatefulWidget {
  @override
  SettingsPreferencesState createState() => SettingsPreferencesState();
}

class SettingsPreferencesState extends State<SettingsPreferences> {
  List<String> keys;
  String editKey;
  dynamic editedValue;

  List<String> expandedValues = [];

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    keys = List<String>.from(Prefs.getKeys());
    keys.sort();
  }

  @override
  void dispose() {
    for (var i = 0; i < controllers.length; i++) {
      controllers[i].dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      GCWButton(
        text: i18n(context, 'settings_preferences_reset_button_title'),
        onPressed: () {
          showGCWAlertDialog(
            context,
            i18n(context, 'settings_preferences_reset_title'),
            i18n(context, 'settings_preferences_reset_text'),
            () {
              setState(() {
                initDefaultSettings(resetToDefault: true);
              });
            }
          );
        },
      ),
    ];

    children.addAll(keys.map((String key) {
      return _buildPreferencesView(key);
    }).toList());

    return Column(
      children: children,
    );
  }

  Widget _buildPreferencesView(String key) {
    var prefValue = Prefs.get(key).toString();

    return Container(
      color: keys.indexOf(key) % 2 == 0 ? themeColors().outputListOddRows() : null,
      child: Column(
        children: [
          Container(
            height: 2 * DOUBLE_DEFAULT_MARGIN,
          ),
          GCWTextDivider(
            text: key,
            style: gcwMonotypeTextStyle(),
            suppressBottomSpace: true,
            suppressTopSpace: true,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEditSaveButton(key),
                _buildEmptyButton(key),
                _buildResetButton(key),
                Container(
                  width: 3 * DOUBLE_DEFAULT_MARGIN,
                ),
                _buildCopyButton(key)
              ],
            ),
          ),
          editKey != null && editKey == key
              ? _buildEditView(key)
              : Column(
                  children: [
                    GCWText(
                      text: !expandedValues.contains(key) && prefValue.length > _PREF_VALUE_MAX_LENGTH ? prefValue.substring(0, _PREF_VALUE_MAX_LENGTH) + '...' : prefValue,
                      style: gcwMonotypeTextStyle().copyWith(fontSize: defaultFontSize() - 3),
                    ),
                    prefValue.length > _PREF_VALUE_MAX_LENGTH
                      ? Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GCWIconButton(
                                icon: expandedValues.contains(key) ? Icons.arrow_drop_up : Icons.more_horiz,
                                size: IconButtonSize.SMALL,
                                onPressed: () {
                                  setState(() {
                                    expandedValues.contains(key) ? expandedValues.remove(key) : expandedValues.add(key);
                                  });
                                },
                              )
                            ],
                          )
                        )
                      : Container()
                  ],
                ),
            Container(
              height: 2 * DOUBLE_DEFAULT_MARGIN,
            )
        ],
      )
    );
  }

  _buildEditSaveButton(String key) {
    return GCWIconButton(
      icon: editKey != null && editKey == key ? Icons.save : Icons.edit,
      onPressed: () {
        setState(() {
          if (editKey == key) {
            _doOnSave(key);
          } else {
            editKey = key;
            editedValue = null;
          }
        });
      },
    );
  }

  _doOnSave(String key) {
    if (!_prefValueHasChanged(key)) {
      setState(() {
        editKey = null;
        editedValue = null;
      });

      return;
    }

    showGCWAlertDialog(
      context,
      i18n(context, 'settings_preferences_warning_save_title'),
      i18n(context, 'settings_preferences_warning_save_text'),
      () {
        switch (_getPrefType(key)) {
          case _PrefType.STRING:
            Prefs.setString(key, editedValue.toString());
            break;
          case _PrefType.INT:
            if (editedValue is int)
              Prefs.setInt(key, editedValue);
            break;
          case _PrefType.DOUBLE:
            if (editedValue is double)
              Prefs.setDouble(key, editedValue);
            break;
          case _PrefType.BOOL:
            if (editedValue is bool)
              Prefs.setBool(key, editedValue);
            break;
          case _PrefType.OBJECTLIST:
          case _PrefType.STRINGLIST:
            if (editedValue is List<String>) {
              (editedValue as List<String>).removeWhere((element) => element.isEmpty);

              Prefs.setStringList(key, editedValue);
            }
            break;
        }

        setState(() {
          editKey = null;
          editedValue = null;
        });
      }
    );
  }

  _prefValueHasChanged(String key) {
    if (editedValue == null)
      return false;

    switch (_getPrefType(key)) {
      case _PrefType.STRING:
      case _PrefType.INT:
      case _PrefType.DOUBLE:
      case _PrefType.BOOL:
        return editedValue != Prefs.get(key);
      case _PrefType.OBJECTLIST:
      case _PrefType.STRINGLIST:
        var list = Prefs.get(key);
        if (editedValue.length != list.length)
          return true;

        for (var i = 0; i < list.length; i++) {
          if (editedValue[i].toString() != list[i].toString()) {
            return true;
          }
        }

        return false;
    }
  }

  _buildEmptyButton(String key) {
    switch (_getPrefType(key)) {
      case _PrefType.STRING:
      case _PrefType.OBJECTLIST:
      case _PrefType.STRINGLIST:
        return GCWIconButton(
          icon: Icons.close,
          onPressed: () {
            showGCWAlertDialog(
              context,
              i18n(context, 'settings_preferences_warning_save_title'),
              i18n(context, 'settings_preferences_warning_empty_text'),
                  () {
                switch (_getPrefType(key)) {
                  case _PrefType.STRING:
                    Prefs.setString(key, '');
                    break;
                  case _PrefType.OBJECTLIST:
                  case _PrefType.STRINGLIST:
                    Prefs.setStringList(key, []);
                    break;
                }
              }
            );
          },
        );
    }

    return Container();
  }

  _buildResetButton(String key) {
    return GCWIconButton(
      icon: Icons.refresh,
      onPressed: () {
        setState(() {
          editedValue = null;
        });
      },
    );
  }

  _buildCopyButton(String key) {
    return GCWIconButton(
      icon: Icons.copy,
      onPressed: () {
        insertIntoGCWClipboard(context, Prefs.get(key).toString());
      },
    );
  }

  _buildEditView(String key) {
    switch (_getPrefType(key)) {
      case _PrefType.STRING:
        if (controllers.isEmpty) {
          controllers.add(TextEditingController());
        }
        controllers.first.text = editedValue ?? Prefs.getString(key);
        return GCWTextField(
          controller: controllers.first,
          onChanged: (text) {
            editedValue = text;
          },
        );
      case _PrefType.INT:
        return GCWIntegerSpinner(
          value: editedValue ?? Prefs.getInt(key),
          onChanged: (value) {
            setState(() {
              editedValue = value;
            });
          },
        );
      case _PrefType.DOUBLE:
        return GCWDoubleSpinner(
          value: editedValue ?? Prefs.getDouble(key),
          onChanged: (value) {
            setState(() {
              editedValue = value;
            });
          },
        );
      case _PrefType.BOOL:
        return GCWOnOffSwitch(
          value: editedValue ?? Prefs.getBool(key),
          onChanged: (value) {
            setState(() {
              editedValue = value;
            });
          },
        );
      case _PrefType.OBJECTLIST:
      case _PrefType.STRINGLIST:
        if (editedValue == null)
          editedValue = List<String>.from(Prefs.get(key)).map((e) => e.toString()).toList();

        var children = <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              GCWIconButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    editedValue.add('');
                  });
                },
              )
            ],
          )
        ];

        if (editedValue.isEmpty) {
          return Column(
            children: children,
          );
        }

        while (controllers.length < editedValue.length) {
          controllers.add(TextEditingController());
        }

        for (var i = 0; i < editedValue.length; i++) {
          controllers[i].text = editedValue[i].toString();
        }

        children.addAll(
          editedValue.asMap().map<int, Widget>((index, item) {
            return MapEntry<int, Widget>(
                index,
                Row(
                  children: [
                    Expanded(
                      child: GCWTextField(
                        controller: controllers[index],
                        onChanged: (value) {
                          editedValue[index] = value;
                          print(editedValue);
                        },
                      ),
                    ),
                    Container(width: DOUBLE_DEFAULT_MARGIN),
                    GCWIconButton(
                      icon: Icons.remove,
                      onPressed: () {
                        setState(() {
                          editedValue.removeAt(index);
                        });
                      },
                    )
                  ],
                )
            );
          }).values.toList()
        );

        return Column(
          children: children,
        );
    }
  }

  _PrefType _getPrefType(String key) {
    try {
      String x = Prefs.get(key);
      return _PrefType.STRING;
    } catch(e) {}

    try {
      List<String> x = Prefs.get(key);
      return _PrefType.STRINGLIST;
    } catch(e) {}

    try {
      List<Object> x = Prefs.get(key);
      return _PrefType.OBJECTLIST;
    } catch(e) {}

    try {
      int x = Prefs.get(key);
      return _PrefType.INT;
    } catch(e) {}

    try {
      double x = Prefs.get(key);
      return _PrefType.DOUBLE;
    } catch(e) {}

    try {
      bool x = Prefs.get(key);
      return _PrefType.BOOL;
    } catch(e) {}

    return null;
  }
}