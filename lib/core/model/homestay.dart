import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/ui/modular/home/widget/home_square_button.dart';

// part 'homestay.g.dart';

class Homestay{
   String name;
   String sologan;
   String avatar;
   int roomNumber = 6;
   String email;
   String phone;
   List<Room> rooms;
   List<Staff> staffs;
   Map<String, String> scheduleHouseKeeping;
  
  Homestay({
  this.name = "Example Name Homestay",
  this.sologan = "Example Homestay",
  this.avatar = "http://i.hmp.me/m/208a59a85cba09cca0140054558ed701.png",
  this.roomNumber = 6,
  this.email = "tinhphan.38@gmail.com",
  this.rooms,
  this.staffs,
  this.scheduleHouseKeeping,
  this.phone});
}