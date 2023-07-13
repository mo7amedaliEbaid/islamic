
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/app/utils/extensions.dart';

import '../../domain/models/quran/quran_model.dart';
import '../../presentation/resources/font_manager.dart';
import '../../presentation/resources/values.dart';

Future<String> fetchDataFromJson(String jsonPath) async {
  String jsonString = await rootBundle.loadString(jsonPath);
  return jsonString;
}

double calculateFontSize(int noOfChars) {
  double fontSize = 0.0;
  if (0 < noOfChars && noOfChars < 200) {
    fontSize = FontSize.s23;
  } else if (200 < noOfChars && noOfChars < 400) {
    fontSize = FontSize.s22;
  } else if (400 < noOfChars && noOfChars < 600) {
    fontSize = FontSize.s20;
  } else if (600 < noOfChars && noOfChars < 800) {
    fontSize = FontSize.s17;
  } else if (800 < noOfChars && noOfChars < 1000) {
    fontSize = FontSize.s16;
  } else if (1000 < noOfChars && noOfChars < 1200) {
    fontSize = FontSize.s14_5;
  } else {
    fontSize = FontSize.s11_5;
  }
  return fontSize;
}

double calculateQuranPageFontSize(List<AyahModel> ayahs, int noOfSurahs) {
  //285, 385, 1177, 1234, 1122, 1292, 1287, 1179, 1170, 1210, 1259, 1125, 1155, 1099, 1129, 1126, 1151, 1202, 1355, 1221, 1198, 1225, 1182, 1241, 1233,
  // 1186, 1281, 1100, 1463, 1010, 1111, 1313, 1174, 1263, 1379, 1393, 1247, 1066, 1094, 1027, 1164, 1226, 1149, 1006, 1203, 1213, 1219, 1208, 1139, 1238,
  // 1299, 1166, 1147, 1230, 1246, 1145, 1150, 1261, 1215, 1110, 1207, 956, 1278, 1244, 1307, 1104, 1091, 1414, 1235, 990, 1131, 973, 1069, 1081, 1227,
  // 1267, 1335, 1074, 1405, 1237, 1297, 1385, 1140, 1098, 1157, 1314, 1191, 1330, 1082, 966, 1229, 1103, 1115, 1102, 1280, 1450, 1228, 1105, 1024, 1402,
  // 1326, 1351, 1137, 1427, 1332, 1256, 1197, 1133, 1195, 1309, 1293, 1211, 1201, 1194, 946, 1114, 1168, 1339, 1075, 1268, 1350, 1216, 1021, 1128, 1189,
  // 1165, 1169, 1146, 1250, 1124, 1029, 1249, 1223, 1315, 1220, 1162, 1058, 1175, 1172, 1080, 1143, 1141, 1205, 1209, 1118, 1038, 1071, 1120, 1041, 1078,
  // 1119, 1276, 1130, 1222, 1167, 1092, 1007, 1178, 1181, 1324, 1272, 1300, 1159, 1242, 1373, 1288, 1171, 1206, 1190, 1090, 1192, 114
  double fontSize = 0.0;
  int noOfChars = 0;
  for (var ayah in ayahs) {
    noOfChars += ayah.text.length;
  }

  if (noOfChars <= 600) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s24;
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s22;
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s14;
    }
  } else if (noOfChars <= 1000) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s18; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s14_5; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s16; //K
    }
  } else if (noOfChars <= 1050) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16;
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16;
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s16_3;
    }
  } else if (noOfChars <= 1100) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s18; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s14; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s16_3; //K
    }
  } else if (noOfChars <= 1150) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s16; //K
    }
  } else if (noOfChars <= 1200) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15_5; //K
    }
  } else if (noOfChars <= 1250) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s16; //K
    }
  } else if (noOfChars <= 1300) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16_7; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15_7; //K
    }
  } else if (noOfChars <= 1350) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16_3; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15_3; //K
    }
  } else if (noOfChars <= 1400) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16;
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16_3;
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15_3;
    }
  } else if (noOfChars <= 1450) {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15; //K
    }
  } else {
    if (noOfSurahs == 1) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 2) {
      fontSize = FontSize.s16; //K
    } else if (noOfSurahs == 3) {
      fontSize = FontSize.s15; //K
    }
  }

  return fontSize;
}

double calculateFontLineHeight(int noOfChars) {
  double lineHeight = 0.0;
  if (0 < noOfChars && noOfChars < 500) {
    lineHeight = AppSize.s1_5.h;
  } else if (500 < noOfChars && noOfChars < 1200) {
    lineHeight = AppSize.s1_27.h;
  } else {
    lineHeight = AppSize.s1_25.h;
  }
  return lineHeight;
}

String getAyahNumberWithSymbol(int ayahNumber) {
  return "  \uFD3F${ayahNumber.toArabic()}\uFD3E    ";
}

int sum(List<int> numbers) {
  int total = 0;
  for (int number in numbers) {
    total += number;
  }
  return total;
}

String getQuranImageNumberFromPageNumber(int quranPageNumber) {
  return quranPageNumber.toString().padLeft(3, "0");
}

Uri getUri(String url) {
  return Uri.parse(url);
}
