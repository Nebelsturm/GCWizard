import 'dart:core';

import 'package:collection/collection.dart';
import 'package:gc_wizard/tools/science_and_technology/colors/logic/colors_rgb.dart';

class RalColor {
  final String colorcode;
  final String name;

  const RalColor({
    required this.colorcode,
    required this.name,
  });
}

const Map<String, RalColor> RAL_COLOR_CODES = {
  "RAL 1000": RalColor(colorcode: "#CDBA88", name: "ralcolorcodes_color_name_1000"},
  "RAL 1001": RalColor(colorcode: "#D0B084", name: "ralcolorcodes_color_name_1001"},
  "RAL 1002": RalColor(colorcode: "#D2AA6D", name: "ralcolorcodes_color_name_1002"},
  "RAL 1003": RalColor(colorcode: "#F9A800", name: "ralcolorcodes_color_name_1003"},
  "RAL 1004": RalColor(colorcode: "#E49E00", name: "ralcolorcodes_color_name_1004"},
  "RAL 1005": RalColor(colorcode: "#CB8E00", name: "ralcolorcodes_color_name_1005"},
  "RAL 1006": RalColor(colorcode: "#E29000", name: "ralcolorcodes_color_name_1006"},
  "RAL 1007": RalColor(colorcode: "#E88C00", name: "ralcolorcodes_color_name_1007"},
  "RAL 1011": RalColor(colorcode: "#AF804F", name: "ralcolorcodes_color_name_1011"},
  "RAL 1012": RalColor(colorcode: "#DDAF27", name: "ralcolorcodes_color_name_1012"},
  "RAL 1013": RalColor(colorcode: "#E3D9C6", name: "ralcolorcodes_color_name_1013"},
  "RAL 1014": RalColor(colorcode: "#DDC49A", name: "ralcolorcodes_color_name_1014"},
  "RAL 1015": RalColor(colorcode: "#E6D2B5", name: "ralcolorcodes_color_name_1015"},
  "RAL 1016": RalColor(colorcode: "#F1DD38", name: "ralcolorcodes_color_name_1016"},
  "RAL 1017": RalColor(colorcode: "#F6A950", name: "ralcolorcodes_color_name_1017"},
  "RAL 1018": RalColor(colorcode: "#FACA30", name: "ralcolorcodes_color_name_1018"},
  "RAL 1019": RalColor(colorcode: "#A48F7A", name: "ralcolorcodes_color_name_1019"},
  "RAL 1020": RalColor(colorcode: "#A08F65", name: "ralcolorcodes_color_name_1020"},
  "RAL 1021": RalColor(colorcode: "#F6B600", name: "ralcolorcodes_color_name_1021"},
  "RAL 1023": RalColor(colorcode: "#F7B500", name: "ralcolorcodes_color_name_1023"},
  "RAL 1024": RalColor(colorcode: "#BA8F4C", name: "ralcolorcodes_color_name_1024"},
  "RAL 1026": RalColor(colorcode: "#FFFF00", name: "ralcolorcodes_color_name_1026"},
  "RAL 1027": RalColor(colorcode: "#A77F0E", name: "ralcolorcodes_color_name_1027"},
  "RAL 1028": RalColor(colorcode: "#FF9B00", name: "ralcolorcodes_color_name_1028"},
  "RAL 1032": RalColor(colorcode: "#E2A300", name: "ralcolorcodes_color_name_1032"},
  "RAL 1033": RalColor(colorcode: "#F99A1C", name: "ralcolorcodes_color_name_1033"},
  "RAL 1034": RalColor(colorcode: "#EB9C52", name: "ralcolorcodes_color_name_1034"},
  "RAL 1035": RalColor(colorcode: "#908370", name: "ralcolorcodes_color_name_1035"},
  "RAL 1036": RalColor(colorcode: "#80643F", name: "ralcolorcodes_color_name_1036"},
  "RAL 1037": RalColor(colorcode: "#F09200", name: "ralcolorcodes_color_name_1037"},
  "RAL 2000": RalColor(colorcode: "#DA6E00", name: "ralcolorcodes_color_name_2000"},
  "RAL 2001": RalColor(colorcode: "#BA481B", name: "ralcolorcodes_color_name_2001"},
  "RAL 2002": RalColor(colorcode: "#BF3922", name: "ralcolorcodes_color_name_2002"},
  "RAL 2003": RalColor(colorcode: "#F67828", name: "ralcolorcodes_color_name_2003"},
  "RAL 2004": RalColor(colorcode: "#E25303", name: "ralcolorcodes_color_name_2004"},
  "RAL 2005": RalColor(colorcode: "#FF4D06", name: "ralcolorcodes_color_name_2005"},
  "RAL 2007": RalColor(colorcode: "#FFB200", name: "ralcolorcodes_color_name_2007"},
  "RAL 2008": RalColor(colorcode: "#ED6B21", name: "ralcolorcodes_color_name_2008"},
  "RAL 2009": RalColor(colorcode: "#DE5307", name: "ralcolorcodes_color_name_2009"},
  "RAL 2010": RalColor(colorcode: "#D05D28", name: "ralcolorcodes_color_name_2010"},
  "RAL 2011": RalColor(colorcode: "#E26E0E", name: "ralcolorcodes_color_name_2011"},
  "RAL 2012": RalColor(colorcode: "#D5654D", name: "ralcolorcodes_color_name_2012"},
  "RAL 2013": RalColor(colorcode: "#923E25", name: "ralcolorcodes_color_name_2013"},
  "RAL 3000": RalColor(colorcode: "#A72920", name: "ralcolorcodes_color_name_3000"},
  "RAL 3001": RalColor(colorcode: "#9B2423", name: "ralcolorcodes_color_name_3001"},
  "RAL 3002": RalColor(colorcode: "#9B2321", name: "ralcolorcodes_color_name_3002"},
  "RAL 3003": RalColor(colorcode: "#861A22", name: "ralcolorcodes_color_name_3003"},
  "RAL 3004": RalColor(colorcode: "#6B1C23", name: "ralcolorcodes_color_name_3004"},
  "RAL 3005": RalColor(colorcode: "#59191F", name: "ralcolorcodes_color_name_3005"},
  "RAL 3007": RalColor(colorcode: "#3E2022", name: "ralcolorcodes_color_name_3007"},
  "RAL 3009": RalColor(colorcode: "#6D342D", name: "ralcolorcodes_color_name_3009"},
  "RAL 3011": RalColor(colorcode: "#792423", name: "ralcolorcodes_color_name_3011"},
  "RAL 3012": RalColor(colorcode: "#C6846D", name: "ralcolorcodes_color_name_3012"},
  "RAL 3013": RalColor(colorcode: "#972E25", name: "ralcolorcodes_color_name_3013"},
  "RAL 3014": RalColor(colorcode: "#CB7375", name: "ralcolorcodes_color_name_3014"},
  "RAL 3015": RalColor(colorcode: "#D8A0A6", name: "ralcolorcodes_color_name_3015"},
  "RAL 3016": RalColor(colorcode: "#A63D2F", name: "ralcolorcodes_color_name_3016"},
  "RAL 3017": RalColor(colorcode: "#CB555D", name: "ralcolorcodes_color_name_3017"},
  "RAL 3018": RalColor(colorcode: "#C73F4A", name: "ralcolorcodes_color_name_3018"},
  "RAL 3020": RalColor(colorcode: "#BB1E10", name: "ralcolorcodes_color_name_3020"},
  "RAL 3022": RalColor(colorcode: "#CF6955", name: "ralcolorcodes_color_name_3022"},
  "RAL 3024": RalColor(colorcode: "#FF2D21", name: "ralcolorcodes_color_name_3024"},
  "RAL 3026": RalColor(colorcode: "#FF2A1B", name: "ralcolorcodes_color_name_3026"},
  "RAL 3027": RalColor(colorcode: "#AB273C", name: "ralcolorcodes_color_name_3027"},
  "RAL 3028": RalColor(colorcode: "#CC2C24", name: "ralcolorcodes_color_name_3028"},
  "RAL 3031": RalColor(colorcode: "#A63437", name: "ralcolorcodes_color_name_3031"},
  "RAL 3032": RalColor(colorcode: "#701D23", name: "ralcolorcodes_color_name_3032"},
  "RAL 3033": RalColor(colorcode: "#A53A2D", name: "ralcolorcodes_color_name_3033"},
  "RAL 4001": RalColor(colorcode: "#816183", name: "ralcolorcodes_color_name_4001"},
  "RAL 4002": RalColor(colorcode: "#8D3C4B", name: "ralcolorcodes_color_name_4002"},
  "RAL 4003": RalColor(colorcode: "#C4618C", name: "ralcolorcodes_color_name_4003"},
  "RAL 4004": RalColor(colorcode: "#651E38", name: "ralcolorcodes_color_name_4004"},
  "RAL 4005": RalColor(colorcode: "#76689A", name: "ralcolorcodes_color_name_4005"},
  "RAL 4006": RalColor(colorcode: "#903373", name: "ralcolorcodes_color_name_4006"},
  "RAL 4007": RalColor(colorcode: "#47243C", name: "ralcolorcodes_color_name_4007"},
  "RAL 4008": RalColor(colorcode: "#844C82", name: "ralcolorcodes_color_name_4008"},
  "RAL 4009": RalColor(colorcode: "#9D8692", name: "ralcolorcodes_color_name_4009"},
  "RAL 4010": RalColor(colorcode: "#BC4077", name: "ralcolorcodes_color_name_4010"},
  "RAL 4011": RalColor(colorcode: "#6E6387", name: "ralcolorcodes_color_name_4011"},
  "RAL 4012": RalColor(colorcode: "#6B6B7F", name: "ralcolorcodes_color_name_4012"},
  "RAL 5000": RalColor(colorcode: "#314F6F", name: "ralcolorcodes_color_name_5000"},
  "RAL 5001": RalColor(colorcode: "#0F4C64", name: "ralcolorcodes_color_name_5001"},
  "RAL 5002": RalColor(colorcode: "#00387B", name: "ralcolorcodes_color_name_5002"},
  "RAL 5003": RalColor(colorcode: "#1F3855", name: "ralcolorcodes_color_name_5003"},
  "RAL 5004": RalColor(colorcode: "#191E28", name: "ralcolorcodes_color_name_5004"},
  "RAL 5005": RalColor(colorcode: "#005387", name: "ralcolorcodes_color_name_5005"},
  "RAL 5007": RalColor(colorcode: "#376B8C", name: "ralcolorcodes_color_name_5007"},
  "RAL 5008": RalColor(colorcode: "#2B3A44", name: "ralcolorcodes_color_name_5008"},
  "RAL 5009": RalColor(colorcode: "#225F78", name: "ralcolorcodes_color_name_5009"},
  "RAL 5010": RalColor(colorcode: "#004F7C", name: "ralcolorcodes_color_name_5010"},
  "RAL 5011": RalColor(colorcode: "#1A2B3C", name: "ralcolorcodes_color_name_5011"},
  "RAL 5012": RalColor(colorcode: "#0089B6", name: "ralcolorcodes_color_name_5012"},
  "RAL 5013": RalColor(colorcode: "#193153", name: "ralcolorcodes_color_name_5013"},
  "RAL 5014": RalColor(colorcode: "#637D96", name: "ralcolorcodes_color_name_5014"},
  "RAL 5015": RalColor(colorcode: "#007CB0", name: "ralcolorcodes_color_name_5015"},
  "RAL 5017": RalColor(colorcode: "#005B8C", name: "ralcolorcodes_color_name_5017"},
  "RAL 5018": RalColor(colorcode: "#058B8C", name: "ralcolorcodes_color_name_5018"},
  "RAL 5019": RalColor(colorcode: "#005E83", name: "ralcolorcodes_color_name_5019"},
  "RAL 5020": RalColor(colorcode: "#00414B", name: "ralcolorcodes_color_name_5020"},
  "RAL 5021": RalColor(colorcode: "#007577", name: "ralcolorcodes_color_name_5021"},
  "RAL 5022": RalColor(colorcode: "#222D5A", name: "ralcolorcodes_color_name_5022"},
  "RAL 5023": RalColor(colorcode: "#42698C", name: "ralcolorcodes_color_name_5023"},
  "RAL 5024": RalColor(colorcode: "#6093AC", name: "ralcolorcodes_color_name_5024"},
  "RAL 5025": RalColor(colorcode: "#21697C", name: "ralcolorcodes_color_name_5025"},
  "RAL 5026": RalColor(colorcode: "#0F3052", name: "ralcolorcodes_color_name_5026"},
  "RAL 6000": RalColor(colorcode: "#3C7460", name: "ralcolorcodes_color_name_6000"},
  "RAL 6001": RalColor(colorcode: "#366735", name: "ralcolorcodes_color_name_6001"},
  "RAL 6002": RalColor(colorcode: "#325928", name: "ralcolorcodes_color_name_6002"},
  "RAL 6003": RalColor(colorcode: "#50533C", name: "ralcolorcodes_color_name_6003"},
  "RAL 6004": RalColor(colorcode: "#024442", name: "ralcolorcodes_color_name_6004"},
  "RAL 6005": RalColor(colorcode: "#114232", name: "ralcolorcodes_color_name_6005"},
  "RAL 6006": RalColor(colorcode: "#3C392E", name: "ralcolorcodes_color_name_6006"},
  "RAL 6007": RalColor(colorcode: "#2C3222", name: "ralcolorcodes_color_name_6007"},
  "RAL 6008": RalColor(colorcode: "#37342A", name: "ralcolorcodes_color_name_6008"},
  "RAL 6009": RalColor(colorcode: "#27352A", name: "ralcolorcodes_color_name_6009"},
  "RAL 6010": RalColor(colorcode: "#4D6F39", name: "ralcolorcodes_color_name_6010"},
  "RAL 6011": RalColor(colorcode: "#6C7C59", name: "ralcolorcodes_color_name_6011"},
  "RAL 6012": RalColor(colorcode: "#303D3A", name: "ralcolorcodes_color_name_6012"},
  "RAL 6013": RalColor(colorcode: "#7D765A", name: "ralcolorcodes_color_name_6013"},
  "RAL 6014": RalColor(colorcode: "#474135", name: "ralcolorcodes_color_name_6014"},
  "RAL 6015": RalColor(colorcode: "#3D3D36", name: "ralcolorcodes_color_name_6015"},
  "RAL 6016": RalColor(colorcode: "#00694C", name: "ralcolorcodes_color_name_6016"},
  "RAL 6017": RalColor(colorcode: "#587F40", name: "ralcolorcodes_color_name_6017"},
  "RAL 6018": RalColor(colorcode: "#61993B", name: "ralcolorcodes_color_name_6018"},
  "RAL 6019": RalColor(colorcode: "#B9CEAC", name: "ralcolorcodes_color_name_6019"},
  "RAL 6020": RalColor(colorcode: "#37422F", name: "ralcolorcodes_color_name_6020"},
  "RAL 6021": RalColor(colorcode: "#8A9977", name: "ralcolorcodes_color_name_6021"},
  "RAL 6022": RalColor(colorcode: "#3A3327", name: "ralcolorcodes_color_name_6022"},
  "RAL 6024": RalColor(colorcode: "#008351", name: "ralcolorcodes_color_name_6024"},
  "RAL 6025": RalColor(colorcode: "#5E6E3B", name: "ralcolorcodes_color_name_6025"},
  "RAL 6026": RalColor(colorcode: "#005F4E", name: "ralcolorcodes_color_name_6026"},
  "RAL 6027": RalColor(colorcode: "#7EBAB5", name: "ralcolorcodes_color_name_6027"},
  "RAL 6028": RalColor(colorcode: "#315442", name: "ralcolorcodes_color_name_6028"},
  "RAL 6029": RalColor(colorcode: "#006F3D", name: "ralcolorcodes_color_name_6029"},
  "RAL 6032": RalColor(colorcode: "#237F52", name: "ralcolorcodes_color_name_6032"},
  "RAL 6033": RalColor(colorcode: "#46877F", name: "ralcolorcodes_color_name_6033"},
  "RAL 6034": RalColor(colorcode: "#7AACAC", name: "ralcolorcodes_color_name_6034"},
  "RAL 6035": RalColor(colorcode: "#194D25", name: "ralcolorcodes_color_name_6035"},
  "RAL 6036": RalColor(colorcode: "#04574B", name: "ralcolorcodes_color_name_6036"},
  "RAL 6037": RalColor(colorcode: "#008B29", name: "ralcolorcodes_color_name_6037"},
  "RAL 6038": RalColor(colorcode: "#00B51A", name: "ralcolorcodes_color_name_6038"},
  "RAL 7000": RalColor(colorcode: "#7A888E", name: "ralcolorcodes_color_name_7000"},
  "RAL 7001": RalColor(colorcode: "#8C969D", name: "ralcolorcodes_color_name_7001"},
  "RAL 7002": RalColor(colorcode: "#817863", name: "ralcolorcodes_color_name_7002"},
  "RAL 7003": RalColor(colorcode: "#7A7669", name: "ralcolorcodes_color_name_7003"},
  "RAL 7004": RalColor(colorcode: "#9B9B9B", name: "ralcolorcodes_color_name_7004"},
  "RAL 7005": RalColor(colorcode: "#6C6E6B", name: "ralcolorcodes_color_name_7005"},
  "RAL 7006": RalColor(colorcode: "#766A5E", name: "ralcolorcodes_color_name_7006"},
  "RAL 7008": RalColor(colorcode: "#745E3D", name: "ralcolorcodes_color_name_7008"},
  "RAL 7009": RalColor(colorcode: "#5D6058", name: "ralcolorcodes_color_name_7009"},
  "RAL 7010": RalColor(colorcode: "#585C56", name: "ralcolorcodes_color_name_7010"},
  "RAL 7011": RalColor(colorcode: "#52595D", name: "ralcolorcodes_color_name_7011"},
  "RAL 7012": RalColor(colorcode: "#575D5E", name: "ralcolorcodes_color_name_7012"},
  "RAL 7013": RalColor(colorcode: "#575044", name: "ralcolorcodes_color_name_7013"},
  "RAL 7015": RalColor(colorcode: "#4F5358", name: "ralcolorcodes_color_name_7015"},
  "RAL 7016": RalColor(colorcode: "#383E42", name: "ralcolorcodes_color_name_7016"},
  "RAL 7021": RalColor(colorcode: "#2F3234", name: "ralcolorcodes_color_name_7021"},
  "RAL 7022": RalColor(colorcode: "#4C4A44", name: "ralcolorcodes_color_name_7022"},
  "RAL 7023": RalColor(colorcode: "#808076", name: "ralcolorcodes_color_name_7023"},
  "RAL 7024": RalColor(colorcode: "#45494E", name: "ralcolorcodes_color_name_7024"},
  "RAL 7026": RalColor(colorcode: "#374345", name: "ralcolorcodes_color_name_7026"},
  "RAL 7030": RalColor(colorcode: "#928E85", name: "ralcolorcodes_color_name_7030"},
  "RAL 7031": RalColor(colorcode: "#5B686D", name: "ralcolorcodes_color_name_7031"},
  "RAL 7032": RalColor(colorcode: "#B5B0A1", name: "ralcolorcodes_color_name_7032"},
  "RAL 7033": RalColor(colorcode: "#7F8274", name: "ralcolorcodes_color_name_7033"},
  "RAL 7034": RalColor(colorcode: "#92886F", name: "ralcolorcodes_color_name_7034"},
  "RAL 7035": RalColor(colorcode: "#C5C7C4", name: "ralcolorcodes_color_name_7035"},
  "RAL 7036": RalColor(colorcode: "#979392", name: "ralcolorcodes_color_name_7036"},
  "RAL 7037": RalColor(colorcode: "#7A7B7A", name: "ralcolorcodes_color_name_7037"},
  "RAL 7038": RalColor(colorcode: "#B0B0A9", name: "ralcolorcodes_color_name_7038"},
  "RAL 7039": RalColor(colorcode: "#6B665E", name: "ralcolorcodes_color_name_7039"},
  "RAL 7040": RalColor(colorcode: "#989EA1", name: "ralcolorcodes_color_name_7040"},
  "RAL 7042": RalColor(colorcode: "#8E9291", name: "ralcolorcodes_color_name_7042"},
  "RAL 7043": RalColor(colorcode: "#4F5250", name: "ralcolorcodes_color_name_7043"},
  "RAL 7044": RalColor(colorcode: "#B7B3A8", name: "ralcolorcodes_color_name_7044"},
  "RAL 7045": RalColor(colorcode: "#8D9295", name: "ralcolorcodes_color_name_7045"},
  "RAL 7046": RalColor(colorcode: "#7F868A", name: "ralcolorcodes_color_name_7046"},
  "RAL 7047": RalColor(colorcode: "#C8C8C7", name: "ralcolorcodes_color_name_7047"},
  "RAL 7048": RalColor(colorcode: "#817B73", name: "ralcolorcodes_color_name_7048"},
  "RAL 8000": RalColor(colorcode: "#89693E", name: "ralcolorcodes_color_name_8000"},
  "RAL 8001": RalColor(colorcode: "#9D622B", name: "ralcolorcodes_color_name_8001"},
  "RAL 8002": RalColor(colorcode: "#794D3E", name: "ralcolorcodes_color_name_8002"},
  "RAL 8003": RalColor(colorcode: "#7E4B26", name: "ralcolorcodes_color_name_8003"},
  "RAL 8004": RalColor(colorcode: "#8D4931", name: "ralcolorcodes_color_name_8004"},
  "RAL 8007": RalColor(colorcode: "#70452A", name: "ralcolorcodes_color_name_8007"},
  "RAL 8008": RalColor(colorcode: "#724A25", name: "ralcolorcodes_color_name_8008"},
  "RAL 8011": RalColor(colorcode: "#5A3826", name: "ralcolorcodes_color_name_8011"},
  "RAL 8012": RalColor(colorcode: "#66332B", name: "ralcolorcodes_color_name_8012"},
  "RAL 8014": RalColor(colorcode: "#4A3526", name: "ralcolorcodes_color_name_8014"},
  "RAL 8015": RalColor(colorcode: "#5E2F26", name: "ralcolorcodes_color_name_8015"},
  "RAL 8016": RalColor(colorcode: "#4C2B20", name: "ralcolorcodes_color_name_8016"},
  "RAL 8017": RalColor(colorcode: "#442F29", name: "ralcolorcodes_color_name_8017"},
  "RAL 8019": RalColor(colorcode: "#3D3635", name: "ralcolorcodes_color_name_8019"},
  "RAL 8022": RalColor(colorcode: "#1A1718", name: "ralcolorcodes_color_name_8022"},
  "RAL 8023": RalColor(colorcode: "#A45729", name: "ralcolorcodes_color_name_8023"},
  "RAL 8024": RalColor(colorcode: "#795038", name: "ralcolorcodes_color_name_8024"},
  "RAL 8025": RalColor(colorcode: "#755847", name: "ralcolorcodes_color_name_8025"},
  "RAL 8028": RalColor(colorcode: "#513A2A", name: "ralcolorcodes_color_name_8028"},
  "RAL 8029": RalColor(colorcode: "#7F4031", name: "ralcolorcodes_color_name_8029"},
  "RAL 9001": RalColor(colorcode: "#E9E0D2", name: "ralcolorcodes_color_name_9001"},
  "RAL 9002": RalColor(colorcode: "#D7D5CB", name: "ralcolorcodes_color_name_9002"},
  "RAL 9003": RalColor(colorcode: "#ECECE7", name: "ralcolorcodes_color_name_9003"},
  "RAL 9004": RalColor(colorcode: "#2B2B2C", name: "ralcolorcodes_color_name_9004"},
  "RAL 9005": RalColor(colorcode: "#0E0E10", name: "ralcolorcodes_color_name_9005"},
  "RAL 9006": RalColor(colorcode: "#A1A1A0", name: "ralcolorcodes_color_name_9006"},
  "RAL 9007": RalColor(colorcode: "#878581", name: "ralcolorcodes_color_name_9007"},
  "RAL 9010": RalColor(colorcode: "#F1ECE1", name: "ralcolorcodes_color_name_9010"},
  "RAL 9011": RalColor(colorcode: "#27292B", name: "ralcolorcodes_color_name_9011"},
  "RAL 9016": RalColor(colorcode: "#F1F0EA", name: "ralcolorcodes_color_name_9016"},
  "RAL 9017": RalColor(colorcode: "#2A292A", name: "ralcolorcodes_color_name_9017"},
  "RAL 9018": RalColor(colorcode: "#C8CBC4", name: "ralcolorcodes_color_name_9018"},
  "RAL 9022": RalColor(colorcode: "#858583", name: "ralcolorcodes_color_name_9022"},
  "RAL 9023": RalColor(colorcode: "#888A8B", name: "ralcolorcodes_color_name_9023"}
};

MapEntry<String, RalColor>? _ralByRGB(RGB rgb) {
  var hexCode = HexCode.fromRGB(rgb);
  return RAL_COLOR_CODES.entries.firstWhereOrNull(
      (element) => element.value.colorcode.toLowerCase() == hexCode.toString().toLowerCase());
}

Map<String, RalColor> findSimilarRALColors(RGB rgb) {
  var ral = _ralByRGB(rgb);
  if (ral != null) return <String, RalColor>{ral.key: ral.value};

  var RALRGBs = RAL_COLOR_CODES.values.map((ral) => HexCode(ral.colorcode).toRGB()).toList();

  var out = <String, RalColor>{};
  var distance = 0;
  while (distance < 100) {
    distance++;
    var nearestRGBs = findNearestRGBs(rgb, RALRGBs, distance: distance);

    if (nearestRGBs.length >= 5) {
      for (var nearestRGB in nearestRGBs) {
        var nearestRAL = _ralByRGB(nearestRGB);
        if (nearestRAL != null) out.addAll({nearestRAL.key: nearestRAL.value});
      }
      return out;
    }
  }

  return out;
}
