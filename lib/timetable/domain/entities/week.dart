import 'package:equatable/equatable.dart';

import 'day.dart';

class Week extends Equatable {
  final List<Day> days;

  Week(this.days);

  static empty() {
    return Week(
        [Day.empty(), Day.empty(), Day.empty(), Day.empty(), Day.empty()]);
  }

  @override
  List<Object> get props => [days];
}
