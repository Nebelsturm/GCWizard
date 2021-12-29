
import 'package:flutter/material.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/wherigo_urwigo/wherigo_viewer/wherigo_common.dart';

class MediaData {
  final String MediaLUAName;
  final String MediaID;
  final String MediaName;
  final String MediaDescription;
  final String MediaAltText;
  final String MediaType;
  final String MediaFilename;

  MediaData(
      this.MediaLUAName,
      this.MediaID,
      this.MediaName,
      this.MediaDescription,
      this.MediaAltText,
      this.MediaType,
      this.MediaFilename);
}


List<MediaData>getMediaFromCartridge(String LUA, dtable, obfuscator){
  RegExp re = RegExp(r'( = Wherigo.ZMedia)');
  List<String> lines = LUA.split('\n');
  List<MediaData> result = [];
  bool sectionMedia = true;
  bool sectionInner = true;
  int j = 1;
  String LUAname = '';
  String id = '';
  String name = '';
  String description = '';
  String type = '';
  String medianame = '';
  String alttext = '';

  for (int i = 0; i < lines.length; i++){
    if (re.hasMatch(lines[i])) {
      print('##### ZMedia found ##### '+(i+1).toString()+' '+lines[i]);
      LUAname = '';
      id = '';
      name = '';
      description = '';
      type = '';
      medianame = '';
      alttext = '';

      LUAname = getLUAName(lines[i]);

      sectionMedia = true;
      do {
        i++;
        print('     analyze '+(i+1).toString()+' '+lines[i].trim().replaceAll(LUAname + '.', ''));
        if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('Id')) {
          id = getLineData(lines[i], LUAname, 'Id', obfuscator, dtable);
          print((i+1).toString()+' ID ' +id);
        }

        else if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('Name')) {
          name = getLineData(lines[i], LUAname, 'Name', obfuscator, dtable);
          print((i+1).toString()+' name ' +name);
        }

        else if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('Description')) {
          if (lines[i + 1].trim().replaceAll(LUAname + '.', '').startsWith('AltText')) {
            description = getLineData(lines[i], LUAname, 'Description', obfuscator, dtable);
          } else {
            sectionInner = true;
            description = lines[i].trim().replaceAll(LUAname + '.', '');
            i++;
            do {
              if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('AltText'))
                sectionInner = false;
              else
                description = description + lines[i];
              i++;
            } while (sectionInner);
          }
          print((i+1).toString()+' description ' +description);
        }

        else if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('AltText')) {
          alttext = getLineData(lines[i], LUAname, 'AltText', obfuscator, dtable);
          print((i+1).toString()+' alttext ' +alttext);
        }

        else if (lines[i].trim().replaceAll(LUAname + '.', '').startsWith('Resources')) {
          i++;
          sectionInner = true;
          do {
            if (lines[i].trimLeft().startsWith('Filename = ')) {
              medianame = getStructData(lines[i], 'Filename');
              print((i+1).toString()+' medianame ' +medianame);
            }
            else if (lines[i].trimLeft().startsWith('Type = ')) {
              type = getStructData(lines[i], 'Type');
              print((i+1).toString()+' type ' +type);
            }
            else if (lines[i].trimLeft().startsWith('Directives = ')) {
              sectionInner = false;
              sectionMedia = false;
              print((i+1).toString()+' Directives => ' +sectionInner.toString());
            }
            i++;
          } while (sectionInner);
        }

      } while (sectionMedia && (i < lines.length - 1));
      //i = i + j;

      result.add(MediaData(
          LUAname,
          id,
          name,
          description,
          alttext,
          type,
          medianame,
      ));
      print('##### ZMedia ende ##### '+(i+1).toString()+' '+lines[i]);
    }
  };
  return result;
}
