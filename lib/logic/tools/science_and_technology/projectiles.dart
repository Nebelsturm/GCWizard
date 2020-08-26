import 'dart:math';
import 'package:gc_wizard/logic/units/mass.dart';
import 'package:gc_wizard/logic/units/energy.dart';
import 'package:gc_wizard/theme/theme.dart';

enum ProjectilesMode {ENERGY, MASS, VELOCITY}

double calculateEnergy (double mass, double velocity) {
  var massInKG = mass / 1000;

  return massInKG * velocity * velocity / 2;
}

double calculateMass (double energy, double velocity) {
  if ( velocity == 0)
    return 0;
  else
    return 2 * energy / velocity / velocity * 1000;
}

double calculateVelocity (double energy, double mass) {
  var massInKG = mass / 1000;

  if (massInKG == 0)
    return 0;
  else
    return sqrt(2 * energy / massInKG);
}


