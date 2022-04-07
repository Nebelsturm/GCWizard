import 'dart:math';

class AuthentificationTable {
  final List<String> xAxis;
  final List<String> yAxis;
  final List<String> Content;

  AuthentificationTable({this.xAxis, this.yAxis, this.Content});
}

const AUTH_TABLE_Y_AXIS = [
  'A',
  'D',
  'E',
  'G',
  'H',
  'I',
  'L',
  'N',
  'O',
  'R',
  'S',
  'T',
  'U',
];
const AUTH_TABLE_X_AXIS = [
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

const AUTH_RESPONSE_OK = 'bundeswehr_auth_response_ok';
const AUTH_RESPONSE_NOT_OK = 'bundeswehr_auth_response_not_ok';
const AUTH_RESPONSE_INVALID_CALLSIGN_LETTER = 'bundeswehr_auth_response_invalid_callsign_letter';
const AUTH_RESPONSE_INVALID_AUTHENTIFICATION_LETTER = 'bundeswehr_auth_response_invalid_authentification_letter';
const AUTH_RESPONSE_INVALID_AUTHENTIFICATION_CODE = 'bundeswehr_auth_response_invalid_autentification_code';
const AUTH_RESPONSE_ = 'bundeswehr_auth_response_';

String buildAuthBundeswehr(String currentCallSign, String currentLetterAuth, String currentLetterCallSign,
    AuthentificationTable tableNumeralCode, AuthentificationTable tableAuthentificationCode) {
  if (currentCallSign.split('').contains(currentLetterCallSign)) {
    if (AUTH_TABLE_Y_AXIS.contains(currentLetterCallSign)) {
      List<String> result = [];
      List<String> tupel1 = [];
      for (int i = 0; i < tableNumeralCode.Content.length; i++) {
        if (tableNumeralCode.Content[i] == currentLetterCallSign) {
          String t1 = tableNumeralCode.xAxis[i % 13];
          String t2 = tableNumeralCode.yAxis[i ~/ 13];
          tupel1.add(t1 + t2);
          tupel1.add(t2 + t1);
        }
      }

      String authCode = tableAuthentificationCode.Content[
          tableAuthentificationCode.yAxis.indexOf(currentLetterCallSign) * 5 +
              tableAuthentificationCode.xAxis.indexOf(currentLetterAuth)];
      List<String> tupel2 = [];
      for (int i = 0; i < tableNumeralCode.Content.length; i++) {
        if (tableNumeralCode.Content[i] == authCode.split('')[0]) {
          String t1 = tableNumeralCode.xAxis[i % 13];
          String t2 = tableNumeralCode.yAxis[i ~/ 13];
          tupel2.add(t1 + t2);
          tupel2.add(t2 + t1);
        }
      }

      List<String> tupel3 = [];
      for (int i = 0; i < tableNumeralCode.Content.length; i++) {
        if (tableNumeralCode.Content[i] == authCode.split('')[1]) {
          String t1 = tableNumeralCode.xAxis[i % 13];
          String t2 = tableNumeralCode.yAxis[i ~/ 13];
          tupel3.add(t1 + t2);
          tupel3.add(t2 + t1);
        }
      }

      int limit = max(tupel1.length, tupel2.length);
      if (tupel3.length > limit) limit = tupel3.length;
      String line = '';
      for (int i = 0; i < limit; i++) {
        line = '';
        if (i < tupel1.length)
          line = line + tupel1[i] + '  ';
        else
          line = line + '  ' + '  ';

        if (i < tupel2.length)
          line = line + tupel2[i] + '  ';
        else
          line = line + '  ' + '  ';

        if (i < tupel3.length)
          line = line + tupel3[i] + '  ';
        else
          line = line + '  ' + '  ';

        result.add(line);
      }
      return result.join('\n');
    }
    return AUTH_RESPONSE_INVALID_AUTHENTIFICATION_LETTER;
  }
  return AUTH_RESPONSE_INVALID_CALLSIGN_LETTER;
}

String checkAuthBundeswehr(String currentCallSign, String currentAuth, String currentLetterAuth,
    AuthentificationTable tableNumeralCode, AuthentificationTable tableAuthentificationCode) {
  print(currentAuth);
  currentAuth = _normalizeAuthCode(currentAuth);
  if (currentAuth != '') {
    List<String> authCode = currentAuth.split(' ');

    List<String> tupel = authCode[0].split('');
    if (tableNumeralCode.xAxis.contains(tupel[0]) && tableNumeralCode.xAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;
    if (tableNumeralCode.yAxis.contains(tupel[0]) && tableNumeralCode.yAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;

    String char = '';
    if (tableNumeralCode.xAxis.contains(tupel[0])) {
      char = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[0]) + tableNumeralCode.yAxis.indexOf(tupel[1]) * 13];
    } else {
      char = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[1]) + tableNumeralCode.yAxis.indexOf(tupel[0]) * 13];
    }

    tupel = authCode[1].split('');
    if (tableNumeralCode.xAxis.contains(tupel[0]) && tableNumeralCode.xAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;
    if (tableNumeralCode.yAxis.contains(tupel[0]) && tableNumeralCode.yAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;

    String digit1 = '';
    if (tableNumeralCode.xAxis.contains(tupel[0])) {
      digit1 = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[0]) + tableNumeralCode.yAxis.indexOf(tupel[1]) * 13];
    } else {
      digit1 = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[1]) + tableNumeralCode.yAxis.indexOf(tupel[0]) * 13];
    }

    tupel = authCode[2].split('');
    if (tableNumeralCode.xAxis.contains(tupel[0]) && tableNumeralCode.xAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;
    if (tableNumeralCode.yAxis.contains(tupel[0]) && tableNumeralCode.yAxis.contains(tupel[1]))
      return AUTH_RESPONSE_NOT_OK;

    String digit2 = '';
    if (tableNumeralCode.xAxis.contains(tupel[0])) {
      digit2 = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[0]) + tableNumeralCode.yAxis.indexOf(tupel[1] * 13)];
    } else {
      digit2 = tableNumeralCode
          .Content[tableNumeralCode.xAxis.indexOf(tupel[1]) + tableNumeralCode.yAxis.indexOf(tupel[0]) * 13];
    }

    String digit = '';
    digit = tableAuthentificationCode.Content[tableAuthentificationCode.xAxis.indexOf(currentLetterAuth) +
        tableAuthentificationCode.yAxis.indexOf(char) * 5];

    if (currentCallSign.split('').contains(char) && (digit == digit1 + digit2 || digit == digit2 + digit1)) {
      return AUTH_RESPONSE_OK;
    } else
      return AUTH_RESPONSE_NOT_OK;
  }
  return AUTH_RESPONSE_INVALID_AUTHENTIFICATION_CODE;
}

String _normalizeAuthCode(String currentAuth) {
  currentAuth = currentAuth.replaceAll('.', ' ').replaceAll(',', ' ').replaceAll(' ', '');
  if (currentAuth.length == 6)
    return currentAuth.substring(0, 2) + ' ' + currentAuth.substring(2, 4) + ' ' + currentAuth.substring(4);
  else
    return '';
}
