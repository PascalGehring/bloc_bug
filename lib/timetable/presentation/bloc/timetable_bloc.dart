import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_bug/timetable/domain/entities/timetable_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/timetable.dart';
import '../../domain/entities/week.dart';

import '../../failures.dart';

part 'timetable_event.dart';
part 'timetable_state.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final GetTimetable getTimetable;

  TimetableBloc({
    required this.getTimetable,
  }) : super(TimetableInitial());

  @override
  Stream<TimetableState> mapEventToState(
    TimetableEvent event,
  ) async* {
    if (event is GetFreshTimetable) {
      yield* _mapGetFreshTimetableToState(event);
    }
    if (event is GetCachedTimetable) {
      yield* _mapGetCachedtimetableToState(event);
    }
  }

  int _mapFailureToErroCode(Failure failure) {
    return 0;
  }

  Stream<TimetableState> _mapGetFreshTimetableToState(
      GetFreshTimetable event) async* {
    yield TimetableRefreshing(oldTimetable: event.oldTimetable);
    final Either<Failure, Week> failureOrTimetable = await (getTimetable(true));
    yield* failureOrTimetable.fold((failure) async* {
      yield TimetableRefreshError(
          errorCode: _mapFailureToErroCode(failure),
          oldTimetable: event.oldTimetable);
    }, (week) async* {
      yield TimetableRefreshed(timetable: Timetable([week]), message: 1);
    });
  }

  Stream<TimetableState> _mapGetCachedtimetableToState(
      GetCachedTimetable event) async* {
    final Either<Failure, Week> failureOrTimetable =
        await (getTimetable(false));

    yield* failureOrTimetable.fold((failure) async* {
      yield TimetableCacheError(oldTimetable: event.oldTimetable);
    }, (week) async* {
      yield TimetableCached(timetable: Timetable([week]));
    });
  }
}

class GetTimetable {
  call(bool fresh) async {
    if (fresh) {
      await Future.delayed(const Duration(seconds: 2));
      Either<Failure, Week> either = Right(Week([
        Day([Lesson.createFreeLesson()])
      ]));

      return either;
    } else {
      await Future.delayed(const Duration(milliseconds: 50));

      Either<Failure, Week> either = Right(Week([
        Day([Lesson.createFreeLesson()])
      ]));

      return either;
    }
  }
}
