part of 'timetable_bloc.dart';

abstract class TimetableState extends Equatable {
  const TimetableState();

  @override
  List<Object> get props => [];
}

class TimetableInitial extends TimetableState {
  final Timetable emptyTimetable = Timetable.empty();
}

class TimetableCacheError extends TimetableState {
  final Timetable oldTimetable;

  TimetableCacheError({required this.oldTimetable});

  @override
  List<Object> get props => [oldTimetable];
}

class TimetableCached extends TimetableState {
  final Timetable timetable;

  TimetableCached({required this.timetable});

  @override
  List<Object> get props => [timetable];
}

class TimetableRefreshing extends TimetableState {
  final Timetable oldTimetable;

  TimetableRefreshing({required this.oldTimetable});

  @override
  List<Object> get props => [oldTimetable];
}

class TimetableRefreshed extends TimetableState {
  final Timetable timetable;
  final int message;

  TimetableRefreshed({required this.timetable, required this.message});

  @override
  List<Object> get props => [timetable, message];
}

class TimetableRefreshError extends TimetableState {
  final Timetable oldTimetable;
  final int errorCode;

  TimetableRefreshError({required this.oldTimetable, required this.errorCode});

  @override
  List<Object> get props => [oldTimetable, errorCode];
}
