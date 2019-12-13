

import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/core/service/api.dart';

class Service{
  
  static Service _instance  = Service._internal();
  Homestay homestay;
  Api _api;

  
  factory Service(){
  
    return _instance;
  }

  getRoom(int id){
    return homestay.rooms[id];
  }

  setDetail(Detail detail, int roomIndex){
    if(homestay.rooms[roomIndex].details == null){
      homestay.rooms[roomIndex].details = List();
    }
    homestay.rooms[roomIndex].details.add(detail);
  }

  setHome({ Homestay home}){
   homestay = home;
  }

  getHomeDefault(){
      List<Room> rooms = [
      Room(title: "Room 1",details: [],state: RoomState.clean),
      Room(title: "Room 2",details: [],state: RoomState.clean),
      Room(title: "Room 3",details: [],state: RoomState.clean),
    ];

    homestay = Homestay(
      name: "Default Name",
      sologan: "Defaule sologan",
      avatar: "https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/p1080x2048/80665727_428900354680324_4683727390373838848_n.png?_nc_cat=111&_nc_ohc=e5FX5xU3HbwAQlj2tup0hJBU7kf1Zkmz4NcBhuYLVhv7QW7HH6Hg5G_9g&_nc_ht=scontent.fsgn2-4.fna&oh=f74b0352584369840bc1cbd68be4901f&oe=5EB2DBF4",
      roomNumber: 3,
      email: "tinhpt.38@gmail.com",
      phone: "0352974899",
      rooms: rooms,
      staffs: null,
      scheduleHouseKeeping: null
    );
  }

  getHomeFromUser(Staff admin){
    
  }


  Service._internal(){
    _api = Api();
    getHomeDefault();
  }
}