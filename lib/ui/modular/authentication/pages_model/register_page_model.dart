


import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class RegisterPageModel extends BasePageModel{
  

  RegisterPageModel(){

  }

  createStaff(
    String fullName,
    String email,
    String role,
    String password){
    return Staff(
      fullName: fullName,
      email: email,
      role: role,
      password: password
    );
  }

}