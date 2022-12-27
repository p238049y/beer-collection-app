import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('yyyy/MM/dd');
DateFormat dateMonthFormat = DateFormat('MM/dd');

class DatePeriod {
  DateTime startDate = DateTime.utc(0, 0, 0);
  DateTime endDate = DateTime.utc(0, 0, 0);

  DatePeriod(this.startDate, this.endDate);
}

DatePeriod getWeekDate(){
  DateTime today = DateTime.now();

  ///日曜日: 0, 土曜日: 6
  int weekdayToday = today.weekday % 7;

  DateTime startDate = today.subtract(Duration(days: weekdayToday));
  DateTime endDate = startDate.add(const Duration(days: 6));

  DatePeriod period = DatePeriod(startDate, endDate);

  return period;
}
