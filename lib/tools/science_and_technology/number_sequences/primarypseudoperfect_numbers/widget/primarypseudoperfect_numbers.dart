import 'package:gc_wizard/tools/science_and_technology/number_sequences/widget/numbersequences_check.dart';
import 'package:gc_wizard/tools/science_and_technology/number_sequences/widget/numbersequences_containsdigits.dart';
import 'package:gc_wizard/tools/science_and_technology/number_sequences/widget/numbersequences_digits.dart';
import 'package:gc_wizard/tools/science_and_technology/number_sequences/widget/numbersequences_nthnumber.dart';
import 'package:gc_wizard/tools/science_and_technology/number_sequences/widget/numbersequences_range.dart';
import 'package:gc_wizard/tools/science_and_technology/number_sequences/logic/number_sequence.dart';

class NumberSequencePrimaryPseudoPerfectNumbersCheckNumber extends NumberSequenceCheckNumber {
  NumberSequencePrimaryPseudoPerfectNumbersCheckNumber()
      : super(mode: NumberSequencesMode.PRIMARY_PSEUDOPERFECT_NUMBERS, maxIndex: 7);
}

class NumberSequencePrimaryPseudoPerfectNumbersDigits extends NumberSequenceDigits {
  NumberSequencePrimaryPseudoPerfectNumbersDigits()
      : super(mode: NumberSequencesMode.PRIMARY_PSEUDOPERFECT_NUMBERS, maxDigits: 35);
}

class NumberSequencePrimaryPseudoPerfectNumbersRange extends NumberSequenceRange {
  NumberSequencePrimaryPseudoPerfectNumbersRange()
      : super(mode: NumberSequencesMode.PRIMARY_PSEUDOPERFECT_NUMBERS, maxIndex: 7);
}

class NumberSequencePrimaryPseudoPerfectNumbersNthNumber extends NumberSequenceNthNumber {
  NumberSequencePrimaryPseudoPerfectNumbersNthNumber()
      : super(mode: NumberSequencesMode.PRIMARY_PSEUDOPERFECT_NUMBERS, maxIndex: 7);
}

class NumberSequencePrimaryPseudoPerfectNumbersContainsDigits extends NumberSequenceContainsDigits {
  NumberSequencePrimaryPseudoPerfectNumbersContainsDigits()
      : super(mode: NumberSequencesMode.PRIMARY_PSEUDOPERFECT_NUMBERS, maxIndex: 7);
}
