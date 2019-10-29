// part 'room.g.dart';

class Room {
  String title;
  List<Detail> details;
  RoomState state;

  Room({this.title, this.details, this.state});

  // Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);  
  // Map<String,dynamic> toJson() => _$RoomToJson(json);
}


class Detail{
  String log;

}

enum RoomState{
  busy, clean, watting
}