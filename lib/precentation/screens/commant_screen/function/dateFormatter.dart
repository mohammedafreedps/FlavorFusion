import 'package:intl/intl.dart';

String dateFormatter({required DateTime date}){
  String hr = DateFormat('hh').format(date);
  String min = date.minute.toString();
  String day = date.day.toString();
  String month = date.month.toString();
  String year = date.year.toString();
  String amPm = DateFormat('a').format(date);
  return '$hr / $min $amPm . $day / $month / $year';
}