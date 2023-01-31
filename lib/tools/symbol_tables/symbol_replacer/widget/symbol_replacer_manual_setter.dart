import 'package:flutter/material.dart';
import 'package:gc_wizard/common_widgets/buttons/gcw_button.dart';
import 'package:gc_wizard/common_widgets/buttons/gcw_iconbutton.dart';
import 'package:gc_wizard/common_widgets/dropdowns/gcw_dropdown.dart';
import 'package:gc_wizard/common_widgets/gcw_toolbar.dart';
import 'package:gc_wizard/common_widgets/switches/gcw_twooptions_switch.dart';
import 'package:gc_wizard/common_widgets/textfields/gcw_textfield.dart';
import 'package:gc_wizard/configuration/settings/preferences.dart';
import 'package:gc_wizard/i18n/app_localizations.dart';
import 'package:gc_wizard/theme/theme.dart';
import 'package:gc_wizard/theme/theme_colors.dart';
import 'package:gc_wizard/tools/symbol_tables/logic/symbol_table_data.dart';
import 'package:gc_wizard/tools/symbol_tables/symbol_replacer/logic/symbol_replacer.dart';
import 'package:gc_wizard/tools/symbol_tables/symbol_replacer/widget/symbol_replacer_symboldata.dart';
import 'package:gc_wizard/tools/symbol_tables/widget/gcw_symbol_container.dart';
import 'package:gc_wizard/tools/symbol_tables/widget/gcw_symbol_table_symbol_matrix.dart';
import 'package:prefs/prefs.dart';

class SymbolReplacerManualSetter extends StatefulWidget {
  final SymbolReplacerImage symbolImage;
  List<Symbol> viewSymbols;

  SymbolReplacerManualSetter({Key key, this.symbolImage, this.viewSymbols}) : super(key: key);

  @override
  SymbolReplacerManualSetterState createState() => SymbolReplacerManualSetterState();
}

class SymbolReplacerManualSetterState extends State<SymbolReplacerManualSetter> {
  var _symbolMap = Map<Symbol, Map<String, SymbolData>>();
  List<GCWDropDownMenuItem> _symbolDataItems;
  var _gcwTextStyle = gcwTextStyle();
  var _currentMode = GCWSwitchPosition.left;
  Map<String, SymbolReplacerSymbolData> _currentSymbolData;
  var _init = true;

  TextEditingController _editValueController;

  @override
  void initState() {
    super.initState();
    _editValueController = TextEditingController();
  }

  @override
  void dispose() {
    _editValueController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    var countColumns = mediaQueryData.orientation == Orientation.portrait
        ? Prefs.get(PREFERENCE_SYMBOLTABLES_COUNTCOLUMNS_PORTRAIT)
        : Prefs.get(PREFERENCE_SYMBOLTABLES_COUNTCOLUMNS_LANDSCAPE);

    if (_init) {
      _fillSymbolDataItems(widget.symbolImage.compareSymbols);
      _currentSymbolData = widget.symbolImage?.compareSymbols?.first;
      _fillSymbolMap(widget.symbolImage, widget.viewSymbols);

      // select all
      _symbolMap.values.forEach((image) {
        image.values.first.primarySelected = true;
      });
      if ((_symbolMap.values != null) && _symbolMap.values.isNotEmpty)
        _selectSymbol(_symbolMap.values.first.values.first);

      if ((widget.symbolImage?.compareSymbols == null) ||
          ((widget.viewSymbols == null) ||
              (widget.viewSymbols.isEmpty) ||
              widget.viewSymbols?.first?.symbolGroup?.compareSymbol == null)) _currentMode = GCWSwitchPosition.right;

      _init = false;
      _debugOutput();
    }

    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      widget.symbolImage != null ? _buildEditRow() : Container(),
      _buildMatrix(widget.symbolImage, widget.viewSymbols, countColumns, mediaQueryData),
    ]);
  }

  _fillSymbolMap(SymbolReplacerImage symbolImage, List<Symbol> viewSymbols) {
    if ((symbolImage?.symbols == null) || (viewSymbols == null)) return;

    symbolImage.symbols.where((sym) => viewSymbols.contains(sym)).forEach((symbol) {
      if (_symbolMap.containsKey(symbol)) {
        var _symbolData = _symbolMap[symbol];
        var _displayText = symbol?.symbolGroup?.text ?? '';
        if (_symbolData?.values?.first?.displayName != _displayText)
          _symbolMap[symbol] = cloneSymbolData(_symbolData, _displayText, symbol?.symbolGroup?.manualText);
      } else
        _symbolMap.addAll({
          symbol: {null: SymbolData(bytes: symbol.getImage(),
              displayName: symbol?.symbolGroup?.text ?? '',
              markedOverlay: symbol?.symbolGroup?.manualText)}
        });
    });
  }

  _fillSymbolDataItems(List<Map<String, SymbolReplacerSymbolData>> compareSymbols) {
    _symbolDataItems = (compareSymbols == null)
        ? <GCWDropDownMenuItem>[].toList()
        : compareSymbols.map((symbolData) {
            return _buildDropDownMenuItem(symbolData);
          }).toList();
  }

  Widget _buildMatrix(
      SymbolReplacerImage symbolImage, List<Symbol> viewSymbols, int countColumns, MediaQueryData mediaQueryData) {
    if ((symbolImage?.symbols == null) || (viewSymbols == null)) return Container();

    _fillSymbolMap(symbolImage, viewSymbols);

    return Expanded(
        child: GCWSymbolTableSymbolMatrix(
      fixed: false,
      imageData: _symbolMap.values,
      countColumns: countColumns,
      mediaQueryData: mediaQueryData,
      onChanged: () => setState(() {}),
      selectable: true,
      overlayOn: true,
      scale: widget?.symbolImage?.symbolScale,
      onSymbolTapped: (String tappedText, SymbolData symbolData) {
        setState(() {
          _selectSymbol(symbolData);
        });
      },
    ));
  }

  _selectSymbol(SymbolData symbolData) {
    _selectSymbolDataItem(symbolData);
    _editValueController.text = symbolData.displayName;
  }

  _setSelectedSymbolsText(String text, {SymbolReplacerSymbolData symbolData}) {
    if (_symbolMap != null) {
      var selectedSymbols = <Symbol>[];
      _symbolMap.forEach((symbol, image) {
        var symbolData = image.values.first;
        if (symbolData.primarySelected || symbolData.secondarySelected) selectedSymbols.add(symbol);
      });
      widget.symbolImage.buildSymbolGroup(selectedSymbols);
      if ((selectedSymbols != null) && selectedSymbols.isNotEmpty && (selectedSymbols?.first?.symbolGroup != null)) {
        selectedSymbols.first.symbolGroup.text = text;
        selectedSymbols.first.symbolGroup.compareSymbol = symbolData;
        selectedSymbols.first.symbolGroup.manualText = true;
      }
    }
  }

  Widget _buildEditRow() {
    return Column(
      children: <Widget>[
        (widget.symbolImage?.compareSymbols == null)
            ? Container()
            : GCWTwoOptionsSwitch(
                leftValue: i18n(context, 'symbol_replacer_from_symboltable'),
                rightValue: i18n(context, 'symbol_replacer_own_text'),
                value: _currentMode,
                notitle: true,
                onChanged: (value) {
                  setState(() {
                    _currentMode = value;
                  });
                },
              ),
        _buildTextEditRow()
      ],
    );
  }

  Widget _buildTextEditRow() {
    return Column(children: [
      GCWToolBar(
        children: <Widget>[
          _currentMode == GCWSwitchPosition.right
              ? GCWTextField(
                  controller: _editValueController,
                  autofocus: true,
                )
              : GCWDropDown(
                  value: _currentSymbolData,
                  onChanged: (value) {
                    setState(() {
                      _currentSymbolData = value;
                    });
                  },
                  items: _symbolDataItems),
          GCWIconButton(
            icon: Icons.alt_route,
            iconColor: _symbolMap.values.any((symbol) => symbol.values.first.primarySelected)
                ? null
                : themeColors().inActive(),
            onPressed: () {
              setState(() {
                if (_currentMode == GCWSwitchPosition.left)
                  _setSelectedSymbolsText(_currentSymbolData?.keys?.first,
                      symbolData: _currentSymbolData?.values?.first);
                else
                  _setSelectedSymbolsText(_editValueController.text);
              });
            },
          ),
        ],
        flexValues: [3, 1],
      ),
      Row(
        children: [
          Expanded(
              child: GCWButton(
            text: i18n(context, 'symboltablesexamples_selectall'),
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            onPressed: () {
              setState(() {
                _symbolMap.values.forEach((image) {
                  image.values.first.primarySelected = true;
                });
              });
            },
          )),
          Container(width: DOUBLE_DEFAULT_MARGIN),
          Expanded(
              child: GCWButton(
            text: i18n(context, 'symboltablesexamples_deselectall'),
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            onPressed: () {
              setState(() {
                _symbolMap.values.forEach((image) {
                  image.values.first.primarySelected = false;
                });
              });
            },
          )),
        ],
      ),
      _changeGroupRow()
    ]);
  }

  Widget _changeGroupRow() {
    var currentGroup = widget.viewSymbols?.first?.symbolGroup;
    var currentGroupIndex = currentGroup == null ? -1 : widget.symbolImage.symbolGroups.indexOf(currentGroup);

    return Row(
      children: [
        Expanded(
            child: GCWIconButton(
              icon: Icons.arrow_back,
              //text: 'prev. Group', //i18n(context, 'symboltablesexamples_selectall'),
              //margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              iconColor: currentGroupIndex > 0
                  ? null
                  : themeColors().inActive(),
              onPressed: () {
                setState(() {
                  _selectSymbolGroup(currentGroupIndex, -1);
                });
              },
            )),
        Container(width: DOUBLE_DEFAULT_MARGIN),
        Expanded(
            child: GCWIconButton(
              icon: Icons.arrow_forward,
              //text: 'next Group', //i18n(context, 'symboltablesexamples_deselectall'),
              //margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
              iconColor: currentGroupIndex >= 0 && currentGroupIndex <  -1
                  ? null
                  : themeColors().inActive(),
              onPressed: () {
                setState(() {
                  _selectSymbolGroup(currentGroupIndex, 1);
                });
              },
            )),
      ],
    );
  }

  void _selectSymbolGroup(int index, int offset) {
    var newIndex = (index ?? - 1) + offset;
    if (newIndex < 0) newIndex = widget.symbolImage.symbolGroups.length - 1;
    if (newIndex >= widget.symbolImage.symbolGroups.length) newIndex = 0;

    widget.viewSymbols = widget.symbolImage.symbolGroups[newIndex].symbols;
    _init = true;
    _symbolMap = Map<Symbol, Map<String, SymbolData>>();
  }

  _selectSymbolDataItem(SymbolData symbolData) {
    var compareSymbol = getSymbol(symbolData, _symbolMap)?.symbolGroup?.compareSymbol;
    if ((widget.symbolImage?.compareSymbols != null) && (compareSymbol != null)) {
      for (GCWDropDownMenuItem item in _symbolDataItems)
        if ((item.value is Map<String, SymbolReplacerSymbolData>) &&
            ((item.value as Map<String, SymbolReplacerSymbolData>).values.first == compareSymbol)) {
          _currentSymbolData = item.value;
          break;
        }
    }
  }

  GCWDropDownMenuItem _buildDropDownMenuItem(Map<String, SymbolReplacerSymbolData> symbolData) {
    var iconBytes = symbolData.values.first.bytes;
    var displayText = symbolData.keys.first;
    return GCWDropDownMenuItem(
        value: symbolData,
        child: Row(children: [
          Container(
            child: (iconBytes != null)
                ? GCWSymbolContainer(symbol: Image.memory(iconBytes))
                : Container(width: DEFAULT_LISTITEM_SIZE),
            margin: EdgeInsets.only(left: 2, top: 2, bottom: 2, right: 10),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                (displayText == null) ? Container() : Text(displayText, style: _gcwTextStyle),
              ]))
        ]));
  }

  _debugOutput() {
    var count = 0;
    widget.symbolImage.symbolGroups.forEach((group) {
      count += group.symbols.length;
    });
    print('symbols: ' + widget.symbolImage.symbols.length.toString() + ' groups: ' +
        widget.symbolImage.symbolGroups.length.toString() +'/ ' + count.toString());
  }
}

Map<String, SymbolData> cloneSymbolData(Map<String, SymbolData> image, String text, bool markedOverlay) {
  var symbolData = SymbolData(bytes: image.values.first.bytes, displayName: text ?? '');
  symbolData.primarySelected = image.values.first.primarySelected;
  symbolData.secondarySelected = image.values.first.secondarySelected;
  symbolData.markedOverlay = markedOverlay;
  return {null: symbolData};
}

Symbol getSymbol(SymbolData imageData, Map<Symbol, Map<String, SymbolData>> symbolMap) {
  return symbolMap.entries.firstWhere((entry) => entry.value.values.first == imageData, orElse: () => null)?.key;
}