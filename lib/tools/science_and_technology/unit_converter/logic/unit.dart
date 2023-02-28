abstract class Unit {
  final  String name;
  final String symbol;
  final bool isReferenceUnit;
  late double Function (double) toReference;
  late double Function (double) fromReference;

  Unit(this.name, this.symbol, this.isReferenceUnit, this.toReference, this.fromReference) {
    if (this.isReferenceUnit) {
      toReference = (e) => e;
      fromReference = (e) => e;
    }
  }
}

T getUnitBySymbol<T extends Unit>(List<T> units, String symbol) {
  return units.firstWhere((unit) => unit.symbol == symbol);
}

T getUnitByName<T extends Unit>(List<T> units, String name) {
  return units.firstWhere((unit) => unit.name == name);
}

double convert(double value, Unit from, Unit to) {
  return to.fromReference(from.toReference(value));
}

T getReferenceUnit<T extends Unit>(List<T> units) {
  return units.firstWhere((unit) => unit.isReferenceUnit == true);
}
