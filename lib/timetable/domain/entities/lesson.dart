import 'package:equatable/equatable.dart';
import 'subject.dart';
import 'teacher.dart';

import 'lesson_time.dart';
import 'room.dart';

class Lesson extends Equatable {
  final Subject subject;
  final Teacher teacher;
  final LessonTime time;
  final Room room;
  final bool hasExam;
  final bool takesPlace;
  final String? message;

  Lesson({
    required this.subject,
    required this.teacher,
    required this.time,
    required this.room,
    required this.hasExam,
    required this.takesPlace,
    this.message,
  });

  static Lesson createLunchLesson({
    required LessonTime time,
    required bool takesPlace,
    String? message,
  }) {
    return Lesson(
        subject: Subject.lunch(),
        teacher: Teacher.empty(),
        time: time,
        room: Room.empty(),
        hasExam: false,
        takesPlace: takesPlace,
        message: message);
  }

  static Lesson createFreeLesson() {
    return Lesson(
      subject: Subject.free(),
      teacher: Teacher.empty(),
      time: LessonTime.wholeDay(),
      room: Room.empty(),
      hasExam: false,
      takesPlace: true,
    );
  }

  @override
  List<Object?> get props =>
      [subject, time, room, hasExam, takesPlace, message];
}
