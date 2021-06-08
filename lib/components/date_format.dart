import 'package:intl/intl.dart';

String customDateFormat(DateTime dateTime) {
  final dateformat = DateFormat.yMMMd('en_US');
  // print(dateformat.format(dateTime));
  return dateformat.format(dateTime);
}
