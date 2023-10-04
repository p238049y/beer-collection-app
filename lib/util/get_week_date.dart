import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('yyyy/MM/dd');
DateFormat dateMonthFormat = DateFormat('MM/dd');

class DatePeriod {
  String startDate = '';
  String endDate = '';

  DatePeriod(this.startDate, this.endDate);
}

DatePeriod getWeekDate() {
  DateTime today = DateTime.now();

  ///日曜日: 0, 土曜日: 6
  int weekdayToday = today.weekday % 7;

  DateTime startDate = today.subtract(Duration(days: weekdayToday));
  DateTime endDate = startDate.add(const Duration(days: 6));

  DatePeriod period =
      DatePeriod(dateFormat.format(startDate), dateFormat.format(endDate));

  return period;
}

/// 日付を指定のフォーマットに変換するメソッド
String convertDateFormat(String inputDateTime, String format) {
  DateFormat outputFormat = DateFormat(format);
  DateTime dateTime = outputFormat.parse(inputDateTime);
  return outputFormat.format(dateTime);
}

// 秒をHH時間mm分ss秒
String convertDisplayTime(int timeSec) {
  int hour = 0;
  int minute = 0;
  int seconds = 0;
  if (timeSec < 60) {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${timeSec.toString().padLeft(2, '0')}';
  } else if (timeSec < 3600) {
    minute = (timeSec ~/ 60);
    seconds = timeSec - (60 * minute);
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  } else {
    hour = (timeSec ~/ 3600);
    timeSec = timeSec - (3600 * hour);
    minute = (timeSec ~/ 60);
    seconds = timeSec - (60 * minute);
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
