import 'package:lcs_new_age/i18n/i18n.dart';

const _monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const _monthShortNames = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

String getMonth(int month) => LcsI18n.tr(_monthNames[month - 1]);

String getMonthInSentence(int month) {
  final name = getMonth(month);
  return LcsI18n.currentLocale.startsWith('pt') ? name.toLowerCase() : name;
}

String getMonthShort(int month) => LcsI18n.tr(_monthShortNames[month - 1]);
