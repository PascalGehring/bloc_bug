import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class LessonTime extends Equatable {
  final DateTime start;
  final DateTime end;

  LessonTime({required this.start, required this.end});

  final int currentWeekDay = DateTime.now().toLocal().weekday;

  int _toInt(DateTime time) => time.hour * 60 + time.minute;

  bool get isCurrentLesson {
    if (start.weekday == currentWeekDay) {
      final int start = _toInt(this.start) - 10;

      final int end = _toInt(this.end);

      final int now = _toInt(DateTime.now());

      if ((start < now) && (now < end)) {
        return true;
      }
    }

    return false;
  }

  String get formatedTimeStartAndEndTime {
    String formatedStartTime =
        DateFormat(DateFormat.HOUR24_MINUTE).format(start);

    String formatedEndTime = DateFormat(DateFormat.HOUR24_MINUTE).format(end);

    if (formatedStartTime != '00:00') {
      formatedStartTime = _removeLeadingZeros(formatedStartTime);

      formatedEndTime = _removeLeadingZeros(formatedEndTime);
    }

    return '$formatedStartTime-$formatedEndTime';
  }

  String get formatedTimeStartTime {
    String formatedStartTime =
        DateFormat(DateFormat.HOUR24_MINUTE).format(start);

    formatedStartTime = _removeLeadingZeros(formatedStartTime);

    return formatedStartTime;
  }

  String get formatedDate {
    int day = start.day;
    int month = start.month;
    int year = start.year;

    return '$day.$month.$year';
  }

  static wholeDay() {
    return LessonTime(
        start: DateTime.parse("2012-02-27 00:00:00"),
        end: DateTime.parse("2012-02-28 00:00:00"));
  }

  @override
  List<Object> get props => [start, end];
}

String _removeLeadingZeros(String str) {
  if (str.startsWith('0')) {
    return str.substring(1);
  }
  return str;
}
