import 'package:intl/intl.dart';
import 'package:islamic/app/utils/constants.dart';

extension NonNulString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNulInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNulBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension ArabicNumber on int {
  String toArabic() {
    String arabicString = toString()
        .replaceAll('0', '\u0660')
        .replaceAll('1', '\u0661')
        .replaceAll('2', '\u0662')
        .replaceAll('3', '\u0663')
        .replaceAll('4', '\u0664')
        .replaceAll('5', '\u0665')
        .replaceAll('6', '\u0666')
        .replaceAll('7', '\u0667')
        .replaceAll('8', '\u0668')
        .replaceAll('9', '\u0669');
    return arabicString;
  }
}

extension ConvertTimeFormat on String {
  String convertTo12HourFormat() {
    DateFormat inputFormat = DateFormat('HH:mm');
    DateFormat outputFormat = DateFormat('h:mm');

    DateTime dateTime;
    try {
      dateTime = inputFormat.parse(this);
    } catch (e) {
      String hoursString = split(":")[0];
      String minsString = split(":")[1];
      int hours = int.parse(hoursString);
      if (hours > 12) {
        hours = hours - 12;
      }
      String finalTime = "$hours:$minsString";
      return finalTime;
    }

    String formattedTime = outputFormat.format(dateTime);

    return formattedTime;
  }
}
