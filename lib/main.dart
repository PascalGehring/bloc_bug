import 'package:bloc_bug/timetable/presentation/pages/timetable_page_mobile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: TimetablePageMobile()));
  }
}
