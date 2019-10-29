import 'package:flutter/cupertino.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/model/staff.dart';

class AuthenticationRoute {
 static void goBack(BuildContext context){
   Navigator.pop(context);
 } 

 static void openSelectRolePage(BuildContext context){
   Navigator.pushNamed(context, RouteName.SelectRolePage);
 }

 static void openRegisterPage(BuildContext context, String role){
   Navigator.pushNamed(context, RouteName.ResigterPage,arguments: role);
 }

 static void openHomePage(BuildContext context, Homestay homestay){
   Navigator.pushReplacementNamed(context, RouteName.HomePage, arguments: homestay);
 }
 
 static void openAdminSetupRegisget(BuildContext context, Staff staff){
   Navigator.pushNamed(context, RouteName.AdminSetupPage,arguments: staff);
 }
 
}