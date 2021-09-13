import 'package:equatable/equatable.dart';

import 'lesson.dart';

class Day extends Equatable {
  final List<Lesson> lessons;

  Day(this.lessons);

  static Day empty() {
    return Day([]);
  }

  @override
  List<Object> get props => [lessons];
}
