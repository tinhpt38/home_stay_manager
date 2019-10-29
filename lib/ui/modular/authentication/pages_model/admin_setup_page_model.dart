


import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';
import 'package:home_stay_project/ui/common/regexp.dart';

class AdminSetupPageModel extends BasePageModel{
  
  AdminSetupPageModel();
  Homestay createNewHomeStay(
    String name,
    String sologan,
    String avatar,
    int roomNumber,
    String phone,
    String email){
    return Homestay(
      name: name,
      sologan: sologan,
      avatar: avatar,
      roomNumber: roomNumber,
      email: email,
      phone: phone,
      rooms: List.generate(roomNumber, (i){
        return Room(
          title: "Room ${i+1}",
          details: null,
          state: RoomState.clean
        );
      }),
      staffs: null,
      scheduleHouseKeeping: null
    );
  }
}