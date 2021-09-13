import 'package:equatable/equatable.dart';
import 'week.dart';

class Timetable extends Equatable {
  final List<Week> weeks;

  Timetable(this.weeks);

  static Timetable empty() {
    return Timetable([Week.empty()]);
  }

  @override
  List<Object> get props => [weeks];
}
