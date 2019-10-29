
// part 'staff.g.dart';

class Staff{
  String fullName;
  String birthday;
  String address;
  String id;
  String email;
  String role;
  String password;
  Staff({this.fullName, this.birthday, this.address, this.id, this.email, this.role, this.password});
}

class Admin extends Staff{
  
  void editHomeStay(){

  }
  void removeHomeStay(){

  }

  void createReport(){

  }
}

class Reception extends Staff{

}
class HouseKeeping extends Staff{
  
}