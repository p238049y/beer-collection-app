import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('yyyy/MM/dd');
DateFormat dateMonthFormat = DateFormat('MM/dd');

class DatePeriod {
  String startDate = '';
  String endDate = '';

  DatePeriod(this.startDate, this.endDate);
}

DatePeriod getWeekDate(){
  DateTime today = DateTime.now();

  ///日曜日: 0, 土曜日: 6
  int weekdayToday = today.weekday % 7;

  DateTime startDate = today.subtract(Duration(days: weekdayToday));
  DateTime endDate = startDate.add(const Duration(days: 6));

  DatePeriod period = DatePeriod(dateFormat.format(startDate), dateFormat.format(endDate));

  return period;
}
