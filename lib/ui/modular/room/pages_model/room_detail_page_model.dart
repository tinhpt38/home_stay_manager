import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class RoomDetailPageModel extends BasePageModel{
  Service _service;

  Homestay _home;

  Homestay get home=>_home;

  Room _room;
  Room get room=>_room;

  RoomDetailPageModel({Service service, Room room}){
      _room = room;
     _service = service;
    getHome();
  }

  getHome(){
     _home = _service.homestay;
     notifyListeners();
  }


  
  
}