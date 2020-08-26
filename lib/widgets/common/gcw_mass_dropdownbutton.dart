import 'package:flutter/material.dart';
import 'package:gc_wizard/logic/units/mass.dart';
import 'package:gc_wizard/logic/units/unit.dart';
import 'package:gc_wizard/logic/units/unit_category.dart';
import 'package:gc_wizard/widgets/common/base/gcw_dropdownbutton.dart';

class GCWMassDropDownButton extends StatefulWidget {
  final Function onChanged;
  final value;

  const GCWMassDropDownButton({Key key, this.onChanged, this.value}) : super(key: key);

  @override
  _GCWMassDropDownButtonState createState() => _GCWMassDropDownButtonState();
}

class _GCWMassDropDownButtonState extends State<GCWMassDropDownButton> {
  Mass _currentMassUnit = UNITCATEGORY_MASS.defaultUnit;

  List<Unit> _masses;

  @override
  void initState() {
    super.initState();

    _masses = [
      MASS_GRAM,
      MASS_KILOGRAM,
      MASS_TON,
      MASS_GRAIN,
      MASS_DRAM,
      MASS_OUNCE,
      MASS_POUND,
      MASS_IMPERIALQUARTER,
      MASS_IMPERIALHUNDREDWEIGHT,
      MASS_IMPERIALLONGTON,
      MASS_USQUARTER,
      MASS_USHUNDREDWEIGHT,
      MASS_USSHORTTON,
      MASS_TROYOUNCE,
      MASS_CARAT,
      MASS_PFUND,
      MASS_ZENTNER
    ];
  }


  @override
  Widget build(BuildContext context) {
    return GCWDropDownButton(
      value: widget.value ?? _currentMassUnit,
      onChanged: (newValue) {
        setState(() {
          _currentMassUnit = newValue;
          widget.onChanged(newValue);
        });
      },
      items: _masses.map((mass) {
        return DropdownMenuItem(
          value: mass,
          child: Text(mass.symbol),
        );
      }).toList(),
    );
  }
}
