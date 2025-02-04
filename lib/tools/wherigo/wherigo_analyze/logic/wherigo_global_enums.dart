part of 'package:gc_wizard/tools/wherigo/wherigo_analyze/logic/wherigo_analyze.dart';

enum WHERIGO_OBJECT {
  NULL,
  GWCFILE,
  HEADER,
  LUAFILE,
  LUABYTECODE,
  CHARACTER,
  ITEMS,
  ZONES,
  INPUTS,
  TASKS,
  TIMERS,
  OBFUSCATORTABLE,
  MEDIAFILES,
  MESSAGES,
  VARIABLES,
  RESULTS_GWC,
  RESULTS_LUA
}

enum WHERIGO_FILE_LOAD_STATE { NULL, GWC, LUA, FULL }

enum WHERIGO_BUILDER { NONE, EARWIGO, URWIGO, GROUNDSPEAK, WHERIGOKIT, UNKNOWN }

enum WHERIGO_ANALYSE_RESULT_STATUS { OK, ERROR_GWC, ERROR_LUA, ERROR_HTTP, NONE }

enum WHERIGO_OBJECT_TYPE {NONE, MEDIA, CARTRIDGE, ZONE, CHARACTER, ITEM, TASK, VARIABLES, TIMER, INPUT, MESSAGES }

enum WHERIGO_ACTIONMESSAGETYPE { NONE, TEXT, IMAGE, BUTTON, COMMAND, CASE }

enum WHERIGO_CARTRIDGE_DATA_TYPE {NONE, LUA, GWC}

