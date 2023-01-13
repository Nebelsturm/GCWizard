// https://www.history.navy.mil/research/library/online-reading-room/title-list-alphabetically/n/navajo-code-talker-dictionary.html
// https://www.ancestrycdn.com/aa-k12/1112/assets/Navajo-Code-Talkers-dictionary.pdf

import 'package:gc_wizard/utils/logic_utils/common_utils.dart';
import 'package:gc_wizard/utils/logic_utils/constants.dart';

final Map NAVAJO_ENCODE_ALPHABET = {
  // although the dictionary has several encodings, these are used by kryptografie.de
  // dcode.fr uses all letters randomly for encoding
  'A': 'WOL-LA-CHEE',
  'B': 'SHUSH',
  'C': 'MOASI',
  'D': 'BE',
  'E': 'DZEH',
  'F': 'MA-E',
  'G': 'KLIZZIE',
  'H': 'LIN',
  'I': 'TKIN',
  'J': 'TKELE-CHO-G',
  'K': 'KLIZZIE-YAZZIE',
  'L': 'DIBEH-YAZZIE',
  'M': 'NA-AS-TSO-SI',
  'N': 'NESH-CHEE',
  'O': 'NE-AHS-JAH',
  'P': 'BI-SO-DIH',
  'Q': 'CA-YEILTH',
  'R': 'GAH',
  'S': 'DIBEH',
  'T': 'THAN-ZIE',
  'U': 'NO-DA-IH',
  'V': 'A-KEH-DI-GLINI',
  'W': 'GLOE-IH',
  'X': 'AL-NA-AS-DZOH',
  'Y': 'TSAH-AS-ZIH',
  'Z': 'BESH-DO-TLIZ',
};

final Map NAVAJO_ENCODE_DICTIONARY = {
  'CORPS': 'DIN-NEH-IH',
  'DIVISION': 'ASHIH-HI',
  'REGIMENT': 'TABAHA',
  'BATTALION': 'TACHEENE',
  'COMPANY': 'NAKIA',
  'PLATOON': 'HAS-CLISH-NIH',
  'SECTION': 'YO-IH',
  'SQUAD': 'DEBEH-LI-ZINI',
  'COMMANDINGGEN': 'BIH-KEH-HE',
  'MAJORGEN': 'SO-NA-KIH',
  'BRIGADIERGEN': 'SO-A-LA-IH',
  'COLONEL': 'ATSAH-BESH-LE-GAI',
  'LTCOLONEL': 'CHE-CHIL-BE-TAH-BESH-LEGAI',
  'MAJOR': 'CHE-CHIL-BE-TAH-OLA',
  'CAPTAIN': 'BESH-LEGAI-NAH-KIH',
  'LIEUTENANT': 'BESH-LEGAI-A-LAH-IH',
  'COMMANDINGOFFICER': 'HASH-KAY-GI-NA-TAH',
  'EXECUTIVEOFFICER': 'BIH-DA-HOL-NEHI',
  'AFRICA': 'ZHIN-NI',
  'ALASKA': 'BEH-HGA',
  'AMERICA': 'NE-HE-MAH',
  'AUSTRALIA': 'CHA-YES-DESI',
  'BRITAIN': 'TOH-TA',
  'CHINA': 'CEH-YEHS-BESI',
  'FRANCE': 'DA-GHA-HI',
  'GERMANY': 'BESH-BE-CHA-HE',
  'ICELAND': 'TKIN-KE-YAH',
  'INDIA': 'AH-LE-GAI',
  'ITALY': 'DOH-HA-CHI-YALI-TCHI',
  'JAPAN': 'BEH-NA-ALI-TSOSIE',
  'PHILIPPINE': 'KE-YAH-DA-NA-LHE',
  'RUSSIA': 'SILA-GOL-CHI-IH',
  'SOUTHAMERICA': 'SHA-DE-AH-NE-HI-MAH',
  'SPAIN': 'DEBA-DE-NIH',
  'PLANES': 'WO-TAH-DE-NE-IH',
  'DIVEBOMBER': 'GINI',
  'TORPEDOPLANE': 'TAS-CHIZZIE',
  'OBSPLAN': 'NE-AS-JAH',
  'FIGHTERPLANE': 'DA-HE-TIH-HI',
  'BOMBERPLANE': 'JAY-SHO',
  'PATROLPLANE': 'GA-GIH',
  'TRANSPORT': 'ATSAH',
  'SHIPS': 'TOH-DINEH-IH',
  'BATTLESHIP': 'LO-TSO',
  'AIRCRAFT': 'TSIDI-MOFFA-YE-HI',
  'SUBMARINE': 'BESH-LO',
  'MINESWEEPER': 'CHA',
  'DESTROYER': 'CA-LO',
  'TRANSPORT': 'DINEH-NAY-YE-HI',
  'CRUISER': 'LO-TSO-YAZZIE',
  'MOSQUITOBOAT': 'TSE-E',
  'JANUARY': 'ATSAH-BE-YAZ',
  'FEBRUARY': 'WOZ-CHEIND',
  'MARCH': 'TAH-CHILL',
  'APRIL': 'TAH-TSO',
  'MAY': 'TAH-TSOSIE',
  'JUNE': 'BE-NE-EH-EH-JAH-TSO',
  'JULY': 'BE-NE-TA-TSOSIE',
  'AUGUST': 'BE-NEEN-TA-TSO',
  'SEPTEMBER': 'GHAW-JIH',
  'OCTOBER': 'NIL-CHI-TSOSIE',
  'NOVEMBER': 'NIL-CHI-TSO',
  'DECEMBER': 'YAS-NIL-TES',
  'ABANDON': 'YE-TSAN',
  'ABOUT': 'WOLA-CHI-A-MOFFA-GAHN',
  'ABREAST': 'WOLA-CHEE-BE-YIED',
  'ACCOMPLISH': 'UL-SO',
  'ACCORDING': 'BE-KA-HO',
  'ACKNOWLEDGE': 'HANOT-DZIED',
  'ACTION': 'AH-HA-TINH',
  'ACTIVITY': 'AH-HA-TINH-Y',
  'ADEQUATE': 'BEH-GHA',
  'ADDITION': 'IH-HE-DE-NDEL',
  'ADDRESS': 'YI-CHIN-HA-TSE',
  'ADJACENT': 'BE-GAHI',
  'ADJUST': 'HAS-TAI-NEL-KAD',
  'ADVANCE': 'NAS-SEY',
  'ADVISE': 'NA-NETIN',
  'AERIAL': 'BE-ZONZ',
  'AFFIRMATIVE': 'LANH',
  'AFTER': 'BI-KHA-DI',
  'AGAINST': 'BE-NA-GNISH',
  'AID': 'EDA-ELE-TSOOD',
  'AIR': 'NILCHI',
  'AIRDOME': 'NILCHI-BEGHAN',
  'ALERT': 'HA-IH-DES-EE',
  'ALL': 'TA-A-TAH',
  'ALLIES': 'NIH-HI-CHO',
  'ALONG': 'WOLACHEE-SNEZ',
  'ALSO': 'EH-DO',
  'ALTERNATE': 'NA-KEE-GO-NE-NAN-DEY-HE',
  'AMBUSH': 'KHAC-DA',
  'AMMUNITION': 'BEH-ELI-DOH-BE-CAH-ALI-TAS-AI',
  'AMPHIBIOUS': 'CHAL',
  'AND': 'DO',
  'ANGLE': 'DEE-CAHN',
  'ANNEX': 'IH-NAY-TANI',
  'ANNOUNCE': 'BEH-HA-O-DZE',
  'ANTI': 'WOL-LA-CHEE-TSIN',
  'ANTICIPATE': 'NI-JOL-LIH',
  'ANY': 'TAH-HA-DAH',
  'APPEAR': 'YE-KA-HA-YA',
  'APPROACH': 'BI-CHI-OL-DAH',
  'APPROXIMATE': 'TO-KUS-DAN',
  'ARE': 'GAH-TSO BIG',
  'AREA': 'HAZ-A-GIH',
  'ARMOR': 'BESH-YE-HA-DA-DI-TEH',
  'ARMY': 'LEI-CHA-IH-YIL-KNEE-IH',
  'ARRIVE': 'IL-DAY',
  'ARTILLERY': 'BE-AL-DOH-TSO-LANI',
  'AS': 'AHCE',
  'ASSAULT': 'ALTSEH-E-JAH-HE',
  'ASSEMBLE': 'DE-JI-KASH',
  'ASSIGN': 'BAH-DEH-TAHN',
  'AT': 'AH-DI',
  'ATTACK': 'AL-TAH-JE-JAY',
  'ATTEMPT': 'BO-O-NE-TAH',
  'ATTENTION': 'GIHA',
  'AUTHENTICATOR': 'HANI-BA-AH-HO-ZIN',
  'AUTHORIZE': 'BE-BO-HO-SNEE',
  'AVAILABLE': 'TA-SHOZ-TEH-IH',
  'BAGGAGE': 'KLAILH',
  'BANZAI': 'NE-TAH',
  'BARGE': 'BESH-NA-ELT',
  'BARRAGE': 'BESH-BA-WA-CHIND',
  'BARRIER': 'BIH-CHAN-NI-AH',
  'BASE': 'BIH-TSEE-DIH',
  'BATTERY': 'BIH-BE-AL-DOH-TKA-IH',
  'BATTLE': 'DA-AH-HI-DZI-TSIO',
  'BAY': 'TOH-AH-HI-GHINH',
  'BAZOOKA': 'AH-ZHOL',
  'BE': 'TSES-NAH',
  'BEACH': 'TAH-BAHN',
  'BEEN': 'TSES-NAH-NES-CHEE',
  'BEFORE': 'BIH-TSE-DIH',
  'BEGIN': 'HA-HOL-ZIZ',
  'BELONG': 'TSES-NAH-SNEZ',
  'BETWEEN': 'BI-TAH-KIZ',
  'BEYOND': 'BILH-LA DI',
  'BIVOUAC': 'EHL-NAS-TEH',
  'BOMB': 'A-YE-SHI',
  'BOOBYTRAP': 'DINEH-BA-WHOA-BLEHI',
  'BORNE': 'YE-CHIE-TSAH',
  'BOUNDARY': 'KA-YAH-BI-NA-HAS-DZOH',
  'BULLDOZER': 'DOLA-ALTH-WHOSH',
  'BUNKER': 'TSAS-KA',
  'BUT': 'NEH-DIH',
  'BY': 'BE-GHA',
  'CABLE': 'BESH-LKOH',
  'CALIBER': 'NAHL-KIHD',
  'CAMP': 'TO-ALTSEH-HOGAN',
  'CAMOUFLAGE': 'DI-NES-IH',
  'CAN': 'YAH-DI-ZINI',
  'CANNONEER': 'BE-AL-DOH-TSO-DEY-DIL-DON-IGI',
  'CAPACITY': 'BE-NEL-AH',
  'CAPTURE': 'YIS-NAH',
  'CARRY': 'YO-LAILH',
  'CASE': 'BIT-SAH',
  'CASUALTY': 'BIH-DIN-NE-DEY',
  'CAUSE': 'BI-NIH-NANI',
  'CAVE': 'TSA-OND',
  'CEILING': 'DA-TEL-JAY',
  'CEMETARY': 'JISH-CHA',
  'CENTER': 'ULH-NE-IH',
  'CHANGE': 'THLA-GO-A-NAT-ZAH',
  'CHANNEL': 'HA-TALHI-YAZZIE',
  'CHARGE': 'AH-TAH-GI-JAH',
  'CHEMICAL': 'TA-NEE',
  'CIRCLE': 'NAS-PAS',
  'CIRCUIT': 'AH-HEH-HA-DAILH',
  'CLASS': 'ALTH-AH-A-TEH',
  'CLEAR': 'YO-AH-HOL-ZHOD',
  'CLIFF': 'TSE-YE-CHEE',
  'CLOSE': 'UL-CHI-UH-NAL-YAH',
  'COASTGUARD': 'TA-BAS-DSISSI',
  'CODE': 'YIL-TAS',
  'COLON': 'NAKI-ALH--DEH-DA-AL-ZHIN',
  'COLUMN': 'ALTH-KAY-NE-ZIH',
  'COMBAT': 'DA-AH-HI-JIH-GANH',
  'COMBINATION': 'AL-TKAS-EI',
  'COME': 'HUC-QUO',
  'COMMA': 'TSA-NA-DAHL',
  'COMMERCIAL': 'NAI-EL-NE-HI',
  'COMMIT': 'HUC-QUO-LA-JISH',
  'COMMUNICATION': 'HA-NEH-AL-ENJI',
  'CONCEAL': 'BE-KI-ASZ-JOLE',
  'CONCENTRATION': 'TA-LA-HI-JIH',
  'CONCUSSION': 'WHE-HUS-DIL',
  'CONDITION': 'AH-HO-TAI',
  'CONFERENCE': 'BE-KE-YA-TI',
  'CONFIDENTIAL': 'NA-NIL-IN',
  'CONFIRM': 'TA-A-NEH',
  'CONQUER': 'A-KEH-DES-DLIN',
  'CONSIDER': 'NE-TSA-CAS',
  'CONSIST': 'BILH',
  'CONSOLIDATE': 'AH-HIH-HI-NIL',
  'CONSTRUCT': 'AHL-NEH',
  'CONTACT': 'AH-HI-DI-DAIL',
  'CONTINUE': 'TA-YI-TEH',
  'CONTROL': 'NAI-GHIZ',
  'CONVOY': 'TKAL-KAH-O-NEL',
  'COORDINATE': 'BEH-EH-HO-ZIN-NA-AS-DZOH',
  'COUNTERATTACK': 'WOLTAH-AL-KI-GI-JEH',
  'COURSE': 'CO-JI-GOH',
  'CRAFT': 'AH-TOH',
  'CREEK': 'TOH-NIL-TSANH',
  'CROSS': 'AL-N-AS-DZOH',
  'CUB': 'SHUSH-YAHZ',
  'DASH': 'US-DZOH',
  'DAWN': 'HA-YELI-KAHN',
  'DEFENSE': 'AH-KIN-CIL-TOH',
  'DEGREE': 'NAHL-KIHD',
  'DELAY': 'BE-SITIHN',
  'DELIVER': 'BE-BIH-ZIHDE',
  'DEMOLITION': 'AH-DEEL-TAHI',
  'DENSE': 'HO-DILH-CLA',
  'DEPART': 'DA-DE-YAH',
  'DEPARTMENT': 'HOGAN',
  'DESIGNATE': 'YE-KHI-DEL-NEI',
  'DESPERATE': 'AH-DA-AH-HO-DZAH',
  'DETACH': 'AL-CHA-NIL',
  'DETAIL': 'BE-BEH-SHA',
  'DETONATOR': 'AH-DEEL-TAHI',
  'DIFFICULT': 'NA-NE-KLAH',
  'DIGIN': 'LE-EH-GADE',
  'DIRECT': 'AH-JI-GO',
  'DISEMBARK': 'EH-HA-JAY',
  'DISPATCH': 'LA-CHAI-EN-SEIS-BE-JAY',
  'DISPLACE': 'HIH-DO-NAL',
  'DISPLAY': 'BE-SEIS-NA-NEH',
  'DISPOSITION': 'A-HO-TEY',
  'DISTRIBUTE': 'NAH-NEH',
  'DISTRICT': 'BE-THIN-YA-NI-CHE',
  'DO': 'TSE-LE',
  'DOCUMENT': 'BEH-EH-HO-ZINZ',
  'DRIVE': 'AH-NOL-KAHL',
  'DUD': 'DI-GISS-YAHZIE',
  'DUMMY': 'DI-GISS-TSO',
  'EACH': 'TA-LAHI-NE-ZINI-GO',
  'ECHELON': 'WHO-DZAH',
  'EDGE': 'BE-BA-HI',
  'EFFECTIVE': 'BE-DELH-NEED',
  'EFFORT': 'YEA-GO',
  'ELEMENT': 'AH-NA-NAI',
  'ELEVATE': 'ALI-KHI-HO-NE-OHA',
  'ELIMINATE': 'HA-BEH-TO-DZIL',
  'EMBARK': 'EH-HO-JAY',
  'EMERGENCY': 'HO-NEZ-CLA',
  'EMPLACEMENT': 'LA-AZ-NIL',
  'ENCIRCLE': 'YE-NAS-TEH',
  'ENCOUNTER': 'BI-KHANH',
  'ENGAGE': 'A-HA-NE-HO-TA',
  'ENGINE': 'CHIDI-BI-TSI-TSINE',
  'ENGINEER': 'DAY-DIL-JAH-HE',
  'ENLARGE': 'NIH-TSA-GOH-AL-NEH',
  'ENLIST': 'BIH-ZIH-A-DA-YI-LAH',
  'ENTIRE': 'TA-A-TAH',
  'ENTRENCH': 'E-GAD-AH-NE-LIH',
  'ENVELOP': 'A-ZAH-GI-YA',
  'EQUIPMENT': 'YA-HA-DE-TAHI',
  'ERECT': 'YEH-ZIHN',
  'ESCAPE': 'A-ZEH-HA-GE-YAH',
  'ESTABLISH': 'HAS-TAY-DZAH',
  'ESTIMATE': 'BIH-KE-TSE-HOD-DES-KEZ',
  'EVACUATE': 'HA-NA',
  'EXCEPT': 'NEH-DIH',
  'EXCEPT': 'NA-WOL-NE',
  'EXCHANGE': 'ALH-NAHL-YAH',
  'EXECUTE': 'A-DO-NIL',
  'EXPLOSIVE': 'AH-DEL-TAHI',
  'EXPEDITE': 'SHIL-LOH',
  'EXTEND': 'NE-TDALE',
  'EXTREME': 'AL-TSAN-AH-BAHM',
  'FAIL': 'CHA-AL-EIND',
  'FAILURE': 'YEES-GHIN',
  'FARM': 'MAI-BE-HE-AHGAN',
  'FEED': 'DZEH-CHI-YON',
  'FIELD': 'CLO-DIH',
  'FIERCE': 'TOH-BAH-HA-ZSID',
  'FILE': 'BA-EH-CHEZ',
  'FINAL': 'TAH-AH-KWO-DIH',
  'FLAMETHROWER': 'COH-AH-GHIL-TLID',
  'FLANK': 'DAH-DI-KAD',
  'FLARE': 'WO-CHI',
  'FLIGHT': 'MA-E-AS-ZLOLI',
  'FORCE': 'TA-NA-NE-LADI',
  'FORM': 'BE-CHA',
  'FORMATION': 'BE-CHA-YE-LAILH',
  'FORTIFICATION': 'AH-NA-SOZI',
  'FORTIFY': 'AH-NA-SOZI-YAZZIE',
  'FORWARD': 'TEHI',
  'FRAGMENTATION': 'BESH-YAZZIE',
  'FREQUENCY': 'HA-TALHI-TSO',
  'FRIENDLY': 'NEH-HECHO-DA-NE',
  'FROM': 'BI-TSAN-DEHN',
  'FURNISH': 'YEAS-NIL',
  'FURTHER': 'WO-NAS-DI',
  'GARRISON': 'YAH-A-DA-HAL-YON-IH',
  'GASOLINE': 'CHIDI-BI-TOH',
  'GRENADE': 'NI-MA-SI',
  'GUARD': 'NI-DIH-DA-HI',
  'GUIDE': 'NAH-E-THLAI',
  'HALL': 'LHI-TA-A-TA',
  'HALFTRACK': 'ALH-NIH-JAH-A-QUHE',
  'HALT': 'TA-AKWAI-I',
  'HANDLE': 'BET-SEEN',
  'HAVE': 'JO',
  'HEADQUARTER': 'NA-HA-TAH-TA-BA-HOGAN',
  'HELD': 'WO-TAH-TA-EH-DAHN-OH',
  'HIGH': 'WO-TAH',
  'HIGHEXPLOSIVE': 'BE-AL-DOH-BE-CA-BIH-DZIL-IGI',
  'HIGHWAY': 'WO-TAH-HO-NE-TEH',
  'HOLD': 'WO-TKANH',
  'HOSPITAL': 'A-ZEY-AL-IH',
  'HOSTILE': 'A-NAH-NE-DZIN',
  'HOWITZER': 'BE-EL-DON-TS-QUODI',
  'ILLUMINATE': 'WO-CHI',
  'IMMEDIATELY': 'SHIL-LOH',
  'IMPACT': 'A-HE-DIS-GOH',
  'IMPORTANT': 'BA-HAS-TEH',
  'IMPROVE': 'HO-DOL-ZHOND',
  'INCLUDE': 'EL-TSOD',
  'INCREASE': 'HO-NALH',
  'INDICATE': 'BA-HAL-NEH',
  'INFANTRY': 'TA-NEH-NAL-DAHI',
  'INFILTRATE': 'YE-GHA-NE-JEH',
  'INITIAL': 'BEH-ED-DE-DLID',
  'INSTALL': 'EHD-TNAH',
  'INSTALLATION': 'NAS-NIL',
  'INSTRUCT': 'NA-NE-TGIN',
  'INTELLIGENCE': 'HO-YA',
  'INTENSE': 'DZEEL',
  'INTERCEPT': 'YEL-NA-ME-JAH',
  'INTERFERE': 'AH-NILH-KHLAI',
  'INTERPRET': 'AH-TAH-HA-NE',
  'INVESTIGATE': 'NA-ALI-KA',
  'INVOLVE': 'A-TAH',
  'IS': 'SEIS',
  'ISLAND': 'SEIS-KEYAH',
  'ISOLATE': 'BIH-TSA-NEL-KAD',
  'JUNGLE': 'WOH-DI-CHIL',
  'KILL': 'NAZ-TSAID',
  'KILOCYCLE': 'NAS-TSAID-A-KHA-AH-YEH-HA-DILH',
  'LABOR': 'NA-NISH',
  'LAND': 'KAY-YAH',
  'LAUNCH': 'TKA-GHIL-ZHOD',
  'LEADER': 'AH-NA-GHAI',
  'LEAST': 'DE-BE-YAZIE-HA-A-AH',
  'LEAVE': 'DAH-DE-YAH',
  'LEFT': 'NISH-CLA-JIH-GOH',
  'LESS': 'BI-OH',
  'LEVEL': 'DIL-KONH',
  'LIAISON': 'DA-A-HE-GI-ENEH',
  'LIMIT': 'BA-HAS-AH',
  'LITTER': 'NI-DAS-TON',
  'LOCATE': 'A-KWE-EH',
  'LOSS': 'UT-DIN',
  'MACHINEGUN': 'A-KNAH-AS-DONIH',
  'MAGNETIC': 'NA-E-LAHI',
  'MANAGE': 'HASTNI-BEH-NA-HAI',
  'MANEUVER': 'NA-NA-O-NALTH',
  'MAP': 'KAH-YA-NESH-CHAI',
  'MAXIMUM': 'BEL-DIL-KHON',
  'MECHANIC': 'CHITI-A-NAYL-INIH',
  'MECHANIZED': 'CHIDI-DA-AH-HE-GONI',
  'MEDICAL': 'A-ZAY',
  'MEGACYCLE': 'MIL-AH-HEH-AH-DILH',
  'MERCHANTSHIP': 'NA-EL-NEHI-TSIN-NA-AILH',
  'MESSAGE': 'HANE-AL-NEH',
  'MILITARY': 'SILAGO-KEH-GOH',
  'MILLIMETER': 'NA-AS-TSO-SI-A-YE-DO-TISH',
  'MINE': 'HA-GADE',
  'MINIMUM': 'BE-OH',
  'MINUTE': 'AH-KHAY-EL-KIT-YAZZIE',
  'MISSION': 'AL-NESHODI',
  'MISTAKE': 'O-ZHI',
  'MOPPING': 'HA-TAO-DI',
  'MORE': 'THLA-NA-NAH',
  'MORTAR': 'BE-AL-DOH-CID-DA-HI',
  'MOTION': 'NA-HOT-NAH',
  'MOTOR': 'CHIDE-BE-TSE-TSEN',
  'NATIVE': 'KA-HA-TENI',
  'NAVY': 'TAL-KAH-SILAGO',
  'NECESSARY': 'YE-NA-ZEHN',
  'NEGATIVE': 'DO-YA-SHO-DA',
  'NET': 'NA-NES-DIZI',
  'NEUTRAL': 'DO-NEH-LINI',
  'NORMAL': 'DOH-A-TA-H-DAH',
  'NOT': 'NI-DAH-THAN-ZIE',
  'NOTICE': 'NE-DA-TAZI-THIN',
  'NOW': 'KUT',
  'NUMBER': 'BEH-BIH-KE-AS-CHINIGH',
  'OBJECTIVE': 'BI-NE-YEI',
  'OBSERVE': 'HAL-ZID',
  'OBSTACLE': 'DA-HO-DESH-ZHA',
  'OCCUPY': 'YEEL-TSOD',
  'OF': 'TOH-NI-TKAL-LO',
  'OFFENSIVE': 'BIN-KIE-JINH-JIH-DEZ-JAY',
  'ONCE': 'TA-LAI-DI',
  'ONLY': 'TA-EI-TAY-A-YAH',
  'OPERATE': 'YE-NAHL-NISH',
  'OPPORTUNITY': 'ASH-GA-ALIN',
  'OPPOSITION': 'NE-HE-TSAH-JIH-SHIN',
  'OR': 'EH-DO-DAH-GOH',
  'ORANGE': 'TCHIL-LHE-SOI',
  'ORDER': 'BE-EH-HO-ZINI',
  'ORDNANCE': 'LEI-AZ-JAH',
  'ORIGINATE': 'DAS-TEH-DO',
  'OTHER': 'LA-E-CIH',
  'OUT': 'CLO-DIH',
  'OVERLAY': 'BE-KA-HAS-TSOZ',
  'PARENTHESIS': 'ATSANH',
  'PARTICULAR': 'A-YO-AD-DO-NEH',
  'PARTY': 'DA-SHA-JAH',
  'PAY': 'NA-ELI-YA',
  'PENALIZE': 'TAH-NI-DES-TANH',
  'PERCENT': 'YAL',
  'PERIOD': 'DA-AHL-ZHIN',
  'PERIODIC': 'DA-AL-ZHIN-THIN-MOASI',
  'PERMIT': 'GOS-SHI-E',
  'PERSONNEL': 'DA-NE-LEI',
  'PHOTOGRAPH': 'BEH-CHI-MA-HAD-NIL',
  'PILLBOX': 'BI-SO-DIH-DOT-SAHI-BI-TSAH',
  'PINNEDDOWN': 'BIL-DAH-HAS-TANH-YA',
  'PLANE': 'TSIDI',
  'PLASMA': 'DIL-DI-GHILI',
  'POINT': 'BE-SO-DE-DEZ-AHE',
  'PONTOON': 'TKOSH-JAH-DA-NA-ELT',
  'POSITION': 'BILH-HAS-AHN',
  'POSSIBLE': 'TA-HA-AH-TAY',
  'POST': 'SAH-DEI',
  'PREPARE': 'HASH-TAY-HO-DIT-NE',
  'PRESENT': 'KUT',
  'PREVIOUS': 'BIH-TSE-DIH',
  'PRIMARY': 'ALTSEH-NAN-DAY-HI-GIH',
  'PRIORITY': 'HANE-PESODI',
  'PROBABLE': 'DA-TSI',
  'PROBLEM': 'NA-NISH-TSOH',
  'PROCEED': 'NAY-NIH-JIH',
  'PROGRESS': 'NAH-SAI',
  'PROTECT': 'AH-CHANH',
  'PROVIDE': 'YIS-NIL',
  'PURPLE': 'DINL-CHI',
  'PYROTECHNIC': 'COH-NA-CHANH',
  'QUESTION': 'AH-JAH',
  'QUICK': 'SHIL-LOH',
  'RADAR': 'ESAT-TSANH',
  'RAID': 'DEZJAY',
  'RAILHEAD': 'A-DE-GEH-HI',
  'RAILROAD': 'KONH-NA-AL-BANSI-BI-THIN',
  'RALLYING': 'A-LAH-NA-O-GLALIH',
  'RANGE': 'AN-ZAH',
  'RATE': 'GAH-EH-YAHN',
  'RATION': 'NA-A-JAH',
  'RAVINE': 'CHUSH-KA',
  'REACH': 'IL-DAY',
  'READY': 'KUT',
  'REAR': 'BE-KA-DENH',
  'RECEIPT': 'SHOZ-TEH',
  'RECOMMEND': 'CHE-HO-TAI-TAHN',
  'RECONNAISSANCE': 'HA-A-CIDI',
  'RECONNOITER': 'TA-HA-NE-AL-YA',
  'RECORD': 'GAH-AH-NAH-KLOLI',
  'RED': 'LI-CHI',
  'REEF': 'TSA-ZHIN',
  'REEMBARK': 'EH-NA-COH',
  'REFIRE': 'NA-NA-COH',
  'REGULATE': 'NA-YEL-N',
  'REINFORCE': 'NAL-DZIL',
  'RELIEF': 'AGANH-TOL-JAY',
  'RELIEVE': 'NAH-JIH-CO-NAL-YA',
  'REORGANIZE': 'HA-DIT-ZAH',
  'REPLACEMENT': 'NI-NA-DO-NIL',
  'REPORT': 'WHO-NEH',
  'REPRESENTATIVE': 'TKA-NAZ-NILI',
  'REQUEST': 'JO-KAYED-GOH',
  'RESERVE': 'HESH-J-E',
  'RESTRICT': 'BA-HO-CHINI',
  'RETIRE': 'AH-HOS-TEEND',
  'RETREAT': 'JI-DIN-NES-CHANH',
  'RETURN': 'NA-DZAH',
  'REVEAL': 'WHO-NEH',
  'REVERT': 'NA-SI-YIZ',
  'REVETMENT': 'BA-NAS-CLA',
  'RIDGE': 'GAH-GHIL-KEID',
  'RIFLEMAN': 'BE-AL-DO-HOSTEEN',
  'RIVER': 'TOH-YIL-KAL',
  'ROBOTBOMB': 'A-YE-SHI-NA-TAH-IH',
  'ROCKET': 'LESZ-YIL-BESHI',
  'ROLL': 'YEH-MAS',
  'ROUND': 'NAZ-PAS',
  'ROUTE': 'GAH-BIH-TKEEN',
  'RUNNER': 'NIH-DZID-TEIH',
  'SABOTAGE': 'A-TKEL-YAH',
  'SABOTEUR': 'A-TKEL-EL-INI',
  'SAILOR': 'CHA-LE-GAI',
  'SALVAGE': 'NA-HAS-GLAH',
  'SAT': 'BIH-LA-SANA-CID-DA-HI',
  'SCARLET': 'REDLHE-CHI',
  'SCHEDULE': 'BEH-EH-HO-ZINI',
  'SCOUT': 'HA-A-SID-AL-SIZI-GIH',
  'SCREEN': 'BESH-NA-NES-DIZI',
  'SEAMAN': 'TKAL-KAH-DINEH-IH',
  'SECRET': 'BAH-HAS-TKIH',
  'SECTOR': 'YOEHI',
  'SECURE': 'YE-DZHE-AL-TSISI',
  'SEIZE': 'YEEL-STOD',
  'SELECT': 'BE-TAH-HAS-GLA',
  'SEMICOLON': 'DA-AHL-ZHIN-BI-TSA-NA-DAHL',
  'SET': 'DZEH-CID-DA-HI',
  'SHACKLE': 'DI-BAH-NESH-GOHZ',
  'SHELL': 'BE-AL-DOH-BE-CA',
  'SHORE': 'TAH-BAHN',
  'SHORT': 'BOSH-KEESH',
  'SIDE': 'BOSH-KEESH',
  'SIGHT': 'YE-EL-TSANH',
  'SIGNAL': 'NA-EH-EH-GISH',
  'SIMPLEX': 'ALAH-IH-NE-TIH',
  'SIT': 'TKIN-CID-DA-HI',
  'SITUATE': 'A-HO-TAY',
  'SMOKE': 'LIT',
  'SNIPER': 'OH-BEHI',
  'SPACE': 'BE-TKAH',
  'SPECIAL': 'E-YIH-SIH',
  'SPEED': 'YO-ZONS',
  'SPORADIC': 'AH-NA-HO-NEIL',
  'SPOTTER': 'EEL-TSAY-I',
  'SPRAY': 'KLESH-SO-DILZIN',
  'SQUADRON': 'NAH-GHIZI',
  'STORM': 'NE-OL',
  'STRAFF': 'NA-WO-GHI-GOID',
  'STRAGGLER': 'CHY-NE-DE-DAHE',
  'STRATEGY': 'NA-HA-TAH',
  'STREAM': 'TOH-NI-LIH',
  'STRENGTH': 'DZHEL',
  'STRETCH': 'DESZ-TSOOD',
  'STRIKE': 'NAY-DAL-GHAL',
  'STRIP': 'HA-TIH-JAH',
  'STUBBORN': 'NIL-TA',
  'SUBJECT': 'NA-NISH-YAZZIE',
  'SUBMERGE': 'TKAL-CLA-YI-YAH',
  'SUBMIT': 'A-NIH-LEH',
  'SUBORDINATE': 'AL-KHI-NAL-DZL',
  'SUCCEED': 'YAH-TAY-GO-E-ELAH',
  'SUCCESS': 'UT-ZAH',
  'SUCCESSFUL': 'UT-ZAH-HA-DEZ-BIN',
  'SUCCESSIVE': 'UT-ZAH-SID',
  'SUCH': 'YIS-CLEH',
  'SUFFER': 'TO-HO-NE',
  'SUMMARY': 'SHIN-GO-BAH',
  'SUPPLEMENTARY': 'TKA-GO-NE-NAN-DEY-HE',
  'SUPPLY': 'NAL-YEH-HI',
  'SUPPLYSHIP': 'NALGA-HI-TSIN-NAH-AILH',
  'SUPPORT': 'BA-AH-HOT-GLI',
  'SURRENDER': 'NE-NA-CHA',
  'SURROUND': 'NAZ-PAS',
  'SURVIVE': 'YIS-DA-YA',
  'SYSTEM': 'DI-BA-TSA-AS-ZHI-BI-TSIN',
  'TACTICAL': 'E-CHIHN',
  'TAKE': 'GAH-TAHN',
  'TANK': 'CHAY-DA-GAHI',
  'TANKDESTROYER': 'CHAY-DA-GAHI-NAIL-TSAIDI',
  'TARGET': 'WOL-DONI',
  'TASK': 'TAZI-NA-EH-DIL-KID',
  'TEAM': 'DEH-NA-AS-TSO-SI',
  'TERRACE': 'ALI-KHI-HO-NE-OHA',
  'TERRAIN': 'TASHI-NA-HAL-THIN',
  'TERRITORY': 'KA-YAH',
  'THAT': 'TAZI-CHA',
  'THE': 'CHA-GEE',
  'THEIR': 'BIH',
  'THEREAFTER': 'TA-ZI-KWA-I-BE-KA-DI',
  'THESE': 'CHA-GI-O-EH',
  'THEY': 'CHA-GEE',
  'THIS': 'DI',
  'TOGETHER': 'TA-BILH',
  'TORPEDO': 'LO-BE-CA',
  'TOTAL': 'TA-AL-SO',
  'TRACER': 'BEH-NA-AL-KAH-HI',
  'TRAFFICDIAGRAM': 'HANE-BA-NA-AS-DZOH',
  'TRAIN': 'COH-NAI-ALI-BAHN-SI',
  'TRANSPORTATION': 'A-HAH-DA-A-CHA',
  'TRENCH': 'E-GADE',
  'TRIPLE': 'TKA-IH',
  'TROOP': 'NAL-DEH-HI',
  'TRUCK': 'CHIDO-TSO',
  'TYPE': 'ALTH-AH-A-TEH',
  'UNDER': 'BI-YAH',
  'UNIDENTIFIED': 'DO-BAY-HOSEN-E',
  'UNIT': 'DA-AZ-JAH',
  'UNSHACKLE': 'NO-DA-EH-NESH-GOHZ',
  'UNTIL': 'UH-QUO-HO',
  'VICINITY': 'NA-HOS-AH-GIH',
  'VILLAGE': 'CHAH-HO-OH-LHAN-IH',
  'VISIBILITY': 'NAY-ES-TEE',
  'VITAL': 'TA-EH-YE-SY',
  'WARNING': 'BILH-HE-NEH',
  'WAS': 'NE-TEH',
  'WATER': 'TKOH',
  'WAVE': 'YILH-KOLH',
  'WEAPON': 'BEH-DAH-A-HI-JIH-GANI',
  'WELL': 'TO-HA-HA-DLAY',
  'WHEN': 'GLOE-EH-NA-AH-WO-HAI',
  'WHERE': 'GLOE-IH-QUI-AH',
  'WHICH': 'GLOE-IH-A-HSI-TLON',
  'WILL': 'GLOE-IH-DOT-SAHI',
  'WIRE': 'BESH-TSOSIE',
  'WITH': 'BILH',
  'WITHIN': 'BILH-BIGIH',
  'WITHOUT': 'TA-GAID',
  'WOOD': 'CHIZ',
  'WOUND': 'CAH-DA-KHI',
  'YARD': 'A-DEL-TAHL',
  'ZONE': 'BIH-NA-HAS-DZOH',
};

Map NAVAJO_DECODE_DICTIONARY = switchMapKeyValue(NAVAJO_ENCODE_DICTIONARY);

Map NAVAJO_DECODE_ALPHABET = switchMapKeyValue(NAVAJO_ENCODE_ALPHABET);

String shrinkText(String input) {
  return input
      .replaceAll('COMMANDING GEN.', 'COMMANDINGGEN')
      .replaceAll('MAJOR GEN.', 'MAJORGEN')
      .replaceAll('BRIGADIER GEN.', 'BRIGADIERGEN')
      .replaceAll('LT. COLONEL', 'LTCOLONEL')
      .replaceAll('COMMANDING OFFICER', 'COMMANDINGOFFICER')
      .replaceAll('EXECUTIVE OFFICER', 'EXECUTIVEOFFICER')
      .replaceAll('SOUTH AMERICA', 'SOUTHAMERICA')
      .replaceAll('DIVE BOMBER', 'DIVEBOMBER')
      .replaceAll('TORPEDO PLANE', 'TORPEDOPLANE')
      .replaceAll('OBS. PLAN', 'OBSPLAN')
      .replaceAll('FIGHTER PLANE', 'FIGHTERPLANE')
      .replaceAll('BOMBER PLANE', 'BOMBERPLANE')
      .replaceAll('PATROL PLANE', 'PATROLPLANE')
      .replaceAll('MINE SWEEPER', 'MINESWEEPER')
      .replaceAll('MOSQUITO BOAT', 'MOSQUITOBOAT')
      .replaceAll('BOOBY TRAP', 'BOOBYTRAP')
      .replaceAll('BULL DOZER', 'BULLDOZER')
      .replaceAll('COAST GUARD', 'COASTGUARD')
      .replaceAll('COUNTER ATTACK ', 'COUNTERATTACK ')
      .replaceAll('DIG IN', 'DIGIN')
      .replaceAll('FLAME THROWER', 'FLAMETHROWER')
      .replaceAll('HALF TRACK', 'HALFTRACK')
      .replaceAll('HIGH EXPLOSIVE', 'HIGHEXPLOSIVE')
      .replaceAll('MACHINE GUN', 'MACHINEGUN')
      .replaceAll('MERCHANT SHIP', 'MERCHANTSHIP')
      .replaceAll('PILL BOX', 'PILLBOX')
      .replaceAll('PINNED DOWN', 'PINNEDDOWN')
      .replaceAll('ROBOT BOMB', 'ROBOTBOMB')
      .replaceAll('SEMI COLON', 'SEMICOLON')
      .replaceAll('SUPPLY SHIP', 'SUPPLYSHIP')
      .replaceAll('TANK DESTROYER', 'TANKDESTROYER')
      .replaceAll('TRAFFIC DIAGRAM', 'TRAFFICDIAGRAM');
}

String enfoldText(String input) {
  return input
      .replaceAll('COMMANDINGGEN', 'COMMANDING GEN.')
      .replaceAll('MAJORGEN', 'MAJOR GEN.')
      .replaceAll('BRIGADIERGEN', 'BRIGADIER GEN.')
      .replaceAll('LTCOLONEL', 'LT. COLONEL')
      .replaceAll('COMMANDINGOFFICER', 'COMMANDING OFFICER')
      .replaceAll('EXECUTIVEOFFICER', 'EXECUTIVE OFFICER')
      .replaceAll('SOUTHAMERICA', 'SOUTH AMERICA')
      .replaceAll('DIVEBOMBER', 'DIVE BOMBER')
      .replaceAll('TORPEDOPLANE', 'TORPEDO PLANE')
      .replaceAll('OBSPLAN', 'OBS. PLAN')
      .replaceAll('FIGHTERPLANE', 'FIGHTER PLANE')
      .replaceAll('BOMBERPLANE', 'BOMBER PLANE')
      .replaceAll('PATROLPLANE', 'PATROL PLANE')
      .replaceAll('MINESWEEPER', 'MINE SWEEPER')
      .replaceAll('MOSQUITOBOAT', 'MOSQUITO BOAT')
      .replaceAll('BOOBYTRAP', 'BOOBY TRAP')
      .replaceAll('BULLDOZER', 'BULL DOZER')
      .replaceAll('COASTGUARD', 'COAST GUARD')
      .replaceAll('COUNTERATTACK ', 'COUNTER ATTACK ')
      .replaceAll('DIGIN', 'DIG IN')
      .replaceAll('FLAMETHROWER', 'FLAME THROWER')
      .replaceAll('HALFTRACK', 'HALF TRACK')
      .replaceAll('HIGHEXPLOSIVE', 'HIGH EXPLOSIVE')
      .replaceAll('MACHINEGUN', 'MACHINE GUN')
      .replaceAll('MERCHANTSHIP', 'MERCHANT SHIP')
      .replaceAll('PILLBOX', 'PILL BOX')
      .replaceAll('PINNEDDOWN', 'PINNED DOWN')
      .replaceAll('ROBOTBOMB', 'ROBOT BOMB')
      .replaceAll('SEMICOLON', 'SEMI COLON')
      .replaceAll('SUPPLYSHIP', 'SUPPLY SHIP')
      .replaceAll('TANKDESTROYER', 'TANK DESTROYER')
      .replaceAll('TRAFFICDIAGRAM', 'TRAFFIC DIAGRAM');
}

String decodeNavajo(String cipherText, bool useOnlyAlphabet) {
  NAVAJO_DECODE_ALPHABET['BE-LA-SANA'] = 'A';
  NAVAJO_DECODE_ALPHABET['TSE-NILL'] = 'A';
  NAVAJO_DECODE_ALPHABET['TSE-NIHL'] = 'A';
  NAVAJO_DECODE_ALPHABET['NA-HASH-CHID'] = 'B';
  NAVAJO_DECODE_ALPHABET['TOISH-JEH'] = 'B';
  NAVAJO_DECODE_ALPHABET['TLA-GIN'] = 'C';
  NAVAJO_DECODE_ALPHABET['BA-GOSHI'] = 'C';
  NAVAJO_DECODE_ALPHABET['CHINDI'] = 'D';
  NAVAJO_DECODE_ALPHABET['LHA-CHA-EH'] = 'D';
  NAVAJO_DECODE_ALPHABET['AH-JAH'] = 'E';
  NAVAJO_DECODE_ALPHABET['AH-NAH'] = 'E';
  NAVAJO_DECODE_ALPHABET['TSA-E-DONIN-EE'] = 'F';
  NAVAJO_DECODE_ALPHABET['CHUO'] = 'F';
  NAVAJO_DECODE_ALPHABET['AH-TAD'] = 'G';
  NAVAJO_DECODE_ALPHABET['JEHA'] = 'G';
  NAVAJO_DECODE_ALPHABET['CHA'] = 'H';
  NAVAJO_DECODE_ALPHABET['TSE-GAH'] = 'H';
  NAVAJO_DECODE_ALPHABET['YEH-HES'] = 'I';
  NAVAJO_DECODE_ALPHABET['A-CHI'] = 'I';
  NAVAJO_DECODE_ALPHABET['YIL-DOI'] = 'J';
  NAVAJO_DECODE_ALPHABET['TKELE-CHO-GI'] = 'J';
  NAVAJO_DECODE_ALPHABET['AH-YA-TSINNE'] = 'J';
  NAVAJO_DECODE_ALPHABET['BA-AH-NE-DI-TININ'] = 'K';
  NAVAJO_DECODE_ALPHABET['JAD-HO-LONI'] = 'K';
  NAVAJO_DECODE_ALPHABET['KLIZZIE-YAZZI'] = 'K';
  NAVAJO_DECODE_ALPHABET['DIBEH-YAZZI'] = 'L';
  NAVAJO_DECODE_ALPHABET['NASH-DOIE-TSO'] = 'L';
  NAVAJO_DECODE_ALPHABET['AH-JAD'] = 'L';
  NAVAJO_DECODE_ALPHABET['BE-TAS-TNI'] = 'M';
  NAVAJO_DECODE_ALPHABET['TSIN-TLITI'] = 'M';
  NAVAJO_DECODE_ALPHABET['A-CHIN'] = 'N';
  NAVAJO_DECODE_ALPHABET['TSAH'] = 'N';
  NAVAJO_DECODE_ALPHABET['TLO-CHIN'] = 'O';
  NAVAJO_DECODE_ALPHABET['A-KHA'] = 'O';
  NAVAJO_DECODE_ALPHABET['NE-AHS-JSH'] = 'O';
  NAVAJO_DECODE_ALPHABET['CLA-GI-AIH'] = 'P';
  NAVAJO_DECODE_ALPHABET['BI-SODIH'] = 'P';
  NAVAJO_DECODE_ALPHABET['NE-ZHONI'] = 'P';
  NAVAJO_DECODE_ALPHABET['DAH-NES-TSA'] = 'R';
  NAVAJO_DECODE_ALPHABET['AH-LOSZ'] = 'R';
  NAVAJO_DECODE_ALPHABET['KLESH'] = 'S';
  NAVAJO_DECODE_ALPHABET['A-WOH'] = 'T';
  NAVAJO_DECODE_ALPHABET['D-AH'] = 'T';
  NAVAJO_DECODE_ALPHABET['SHI-DA'] = 'U';
  NAVAJO_DECODE_ALPHABET['BSEH-DO-GLIZ'] = 'Z';

  List<String> result = <String>[];
  if (cipherText == null || cipherText == '') return '';
  cipherText = cipherText.toUpperCase().replaceAll(RegExp(r'\s{3,}'), '  ');
  cipherText.split('  ').forEach((element) {
    element.split(' ').forEach((element) {
      if (NAVAJO_DECODE_ALPHABET[element] == null) if (useOnlyAlphabet)
        result.add(UNKNOWN_ELEMENT);
      else if (NAVAJO_DECODE_DICTIONARY[element] == null)
        result.add(UNKNOWN_ELEMENT);
      else
        result.add(enfoldText(NAVAJO_DECODE_DICTIONARY[element]));
      else
        result.add(NAVAJO_DECODE_ALPHABET[element]);
    });
    result.add(' ');
  });
  return result.join('');
}

String encodeNavajo(String plainText, bool useOnlyAlphabet) {
  List<String> result = <String>[];
  if (plainText == null || plainText == '') return '';

  shrinkText(plainText.toUpperCase()).split(' ').forEach((element) {
    if (useOnlyAlphabet)
      result.add(encodeLetterWise(element));
    else if (NAVAJO_ENCODE_DICTIONARY[element] == null)
      result.add(encodeLetterWise(element));
    else
      result.add(NAVAJO_ENCODE_DICTIONARY[element]);
    result.add('');
  });
  return result.join(' ').trim();
}

String encodeLetterWise(String plainText) {
  List<String> result = <String>[];
  plainText.split('').forEach((element) {
    if (NAVAJO_ENCODE_ALPHABET[element] == null)
      result.add(element);
    else
      result.add(NAVAJO_ENCODE_ALPHABET[element]);
  });
  return result.join(' ');
}
