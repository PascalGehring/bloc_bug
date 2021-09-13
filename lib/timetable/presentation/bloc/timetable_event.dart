part of 'timetable_bloc.dart';

abstract class TimetableEvent extends Equatable {
  const TimetableEvent();

  @override
  List<Object> get props => [];
}

class GetFreshTimetable extends TimetableEvent {
  final Timetable oldTimetable;

  GetFreshTimetable({required this.oldTimetable});

  @override
  List<Object> get props => [oldTimetable];
}

class GetCachedTimetable extends TimetableEvent {
  final Timetable oldTimetable;

  GetCachedTimetable({required this.oldTimetable});

  @override
  List<Object> get props => [oldTimetable];
}
