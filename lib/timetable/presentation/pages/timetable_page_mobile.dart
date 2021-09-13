import 'package:bloc_bug/core/stateful_wrapper.dart';
import 'package:bloc_bug/timetable/domain/entities/timetable.dart';
import 'package:bloc_bug/timetable/presentation/bloc/timetable_bloc.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimetablePageMobile extends StatelessWidget {
  TimetablePageMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimetableBloc(getTimetable: GetTimetable()),
      child: BlocBuilder<TimetableBloc, TimetableState>(
        builder: (context, state) {
          Timetable timetable = Timetable.empty();
          if (state is TimetableInitial) {
            timetable = state.emptyTimetable;
          } else if (state is TimetableRefreshing) {
            timetable = state.oldTimetable;
          } else if (state is TimetableCached) {
            timetable = state.timetable;
          } else if (state is TimetableRefreshed) {
            timetable = state.timetable;
          } else if (state is TimetableRefreshError) {
            timetable = state.oldTimetable;
          } else if (state is TimetableCacheError) {
            timetable = state.oldTimetable;
          }

          return StatefulWrapper(
              onInit: () async {
                BlocProvider.of<TimetableBloc>(context)
                    .add(GetCachedTimetable(oldTimetable: timetable));

                await Future.delayed(Duration(seconds: 5));
                BlocProvider.of<TimetableBloc>(context)
                    .add(GetFreshTimetable(oldTimetable: timetable));
              },
              child: Center(
                child: Text(state.toString()),
              ));
        },
      ),
    );
  }
}
