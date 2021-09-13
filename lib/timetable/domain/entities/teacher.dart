import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String? firstName;
  final String? lastName;

  Teacher({
    required this.firstName,
    required this.lastName,
  });

  String get formatedTeacher {
    if (firstName == null && lastName == null) {
      return '-';
    }

    return '$firstName $lastName';
  }

  static empty() {
    return Teacher(firstName: null, lastName: null);
  }

  // bool isEmpty() {
  //   return firstName == null && lastName == null;
  // }

  @override
  List<Object?> get props => [firstName, lastName];
}
