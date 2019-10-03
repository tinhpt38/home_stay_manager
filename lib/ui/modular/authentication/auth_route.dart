import 'package:flutter/cupertino.dart';
import 'package:home_stay_project/core/constant/route_name.dart';

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

 static void openHomePage(BuildContext context){
   Navigator.pushReplacementNamed(context, RouteName.HomePage);
 }
 
 static void openAdminSetupRegisget(BuildContext context, String role){
   Navigator.pushNamed(context, RouteName.AdminSetupPage,arguments: role);
 }
 
}