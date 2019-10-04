// part 'room.g.dart';

class Room {
  String title;
  List<Log> logs;
  RoomState state;

  // Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);  
  // Map<String,dynamic> toJson() => _$RoomToJson(json);
}


class Log{
  String log;

}

enum RoomState{
  busy, clean, watting
}