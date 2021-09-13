import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final String name;
  final String shortName;

  Subject({required this.name, required this.shortName});

  static lunch() {
    return Subject(name: 'Mittag', shortName: 'Mi');
  }

  static free() {
    return Subject(name: 'Frei', shortName: '-');
  }

  @override
  List<Object?> get props => [name, shortName];
}
