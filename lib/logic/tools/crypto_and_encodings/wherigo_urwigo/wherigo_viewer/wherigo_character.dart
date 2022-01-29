
import 'dart:isolate';

import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/wherigo_viewer/wherigo_common.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/wherigo_viewer/wherigo_dataobjects.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/wherigo_viewer/wherigo_zone.dart';



Map<String, dynamic> getCharactersFromCartridge(String LUA, dtable, obfuscator){

  List<String> lines = LUA.split('\n');

  List<CharacterData> Characters = [];
  Map<String, ObjectData> NameToObject = {};
  var out = Map<String, dynamic>();
  bool sectionCharacter = true;
  bool sectionDescription = true;

  String LUAname = '';
  String id = '';
  String name = '';
  String description = '';
  String visible = '';
  String media = '';
  String icon = '';
  String location = '';
  ZonePoint zonePoint = ZonePoint(0.0, 0.0, 0.0);
  String gender = '';
  String type = '';
  String container = '';

  for (int i = 0; i < lines.length; i++){
    if (RegExp(r'( = Wherigo.ZCharacter)').hasMatch(lines[i])) {
      currentObjectSection = OBJECT_TYPE.CHARACTER;
      LUAname = '';
      id = '';
      name = '';
      description = '';
      visible = '';
      media = '';
      icon = '';
      location = '';
      gender = '';
      type = '';

      LUAname = getLUAName(lines[i]);
      container = getContainer(lines[i]);

      sectionCharacter = true;

      do {
        i++;
        if (lines[i].trim().startsWith(LUAname + '.Container =')) {
          container = getContainer(lines[i]);
        }

        if (lines[i].trim().startsWith(LUAname + '.Id')) {
          id = getLineData(lines[i], LUAname, 'Id', obfuscator, dtable);
        }

        if (lines[i].trim().startsWith(LUAname + '.Name')) {
          name = getLineData(lines[i], LUAname, 'Name', obfuscator, dtable);
        }

        if (lines[i].trim().startsWith(LUAname + '.Description')) {
          description = '';
          sectionDescription = true;
          do {
            description = description + lines[i];
            if (i > lines.length - 2 || lines[i + 1].startsWith(LUAname + '.Visible')) {
              sectionDescription = false;
            }
            i++;
          } while (sectionDescription);
          description = description.replaceAll('[[', '').replaceAll(']]', '').replaceAll('<BR>', '\n');
          description = getLineData(description, LUAname, 'Description', obfuscator, dtable);
        }

        if (lines[i].startsWith(LUAname + '.Visible'))
          visible = getLineData(
              lines[i], LUAname, 'Visible', obfuscator, dtable);

        if (lines[i].startsWith(LUAname + '.Media'))
          media = getLineData(
              lines[i], LUAname, 'Media', obfuscator, dtable).trim();

        if (lines[i].startsWith(LUAname + '.Icon'))
          icon = getLineData(
              lines[i], LUAname, 'Icon', obfuscator, dtable);

        if (lines[i].trim().startsWith(LUAname + '.ObjectLocation')) {
          location = lines[i].trim().replaceAll(LUAname + '.ObjectLocation', '').replaceAll(' ', '').replaceAll('=', '');
          if (location.endsWith('INVALID_ZONEPOINT'))
            location = '';
          else if (location.startsWith('ZonePoint')) {
            location = location
                .replaceAll('ZonePoint(', '')
                .replaceAll(')', '')
                .replaceAll(' ', '');
            zonePoint = ZonePoint(double.parse(location.split(',')[0]),
                double.parse(location.split(',')[1]),
                double.parse(location.split(',')[2]));
            location = 'ZonePoint';
          }
          else
            location = getLineData(
                lines[i], LUAname, 'ObjectLocation', obfuscator,
                dtable);
        }

        if (lines[i].startsWith(LUAname + '.Gender')) {
          gender = getLineData(
              lines[i], LUAname, 'Gender', obfuscator, dtable).toLowerCase().trim();
        }

        if (lines[i].startsWith(LUAname + '.Type'))
          type = getLineData(
              lines[i], LUAname, 'Type', obfuscator, dtable);

        if (RegExp(r'( = Wherigo.ZItem)').hasMatch(lines[i]) ||
            RegExp(r'( = Wherigo.ZCharacter)').hasMatch(lines[i])) {
          sectionCharacter = false;
        }
      } while (sectionCharacter);

      Characters.add(CharacterData(
           LUAname ,
           id,
           name,
           description,
           visible,
           media,
           icon,
           location,
           zonePoint,
           container,
           gender,
           type
      ));
      NameToObject[LUAname] = ObjectData(id, 0, name, media, OBJECT_TYPE.CHARACTER);
      i--;
    } // end if
  }; // end for

  out.addAll({'content': Characters});
  out.addAll({'names': NameToObject});
  return out;
}
