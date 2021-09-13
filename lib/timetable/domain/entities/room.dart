import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String? roomString;

  Room({required this.roomString});

  final RegExp characters = RegExp(r'[a-zA-Z]');

  String get roomNumber {
    if (roomString == null) {
      return '-';
    }
    if (roomString!.contains(characters)) {
      try {
        if (roomString != null) {
          return int.parse(roomString!.substring(1)).toString();
        }
      } catch (_) {
        return roomString!;
      }
    }
    return roomString!;
  }

  get roomWithBuilding {
    if (roomString == null) {
      return '-';
    }
    if (buildingName == null) {
      return roomNumber;
    }

    return '$buildingName $roomNumber';
  }

  String? get buildingName {
    return null;
  }

  static empty() {
    return Room(roomString: null);
  }

  bool isEmpty() {
    return roomString == null;
  }

  @override
  List<Object?> get props => [roomString];
}
