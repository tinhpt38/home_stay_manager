import 'package:flutter/widgets.dart';
import 'package:home_stay_project/core/constant/route_name.dart';

class HomeRoute{
  
  static void openCheckInPage(BuildContext context){

  }

  static void goBack(BuildContext context){
    Navigator.pop(context);
  }

  static void openListRoomPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.ListRoomPage);
  }
  static void openSettingPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.SettingPage);
  }
  
  static void openCreateSchedulePage(BuildContext context){

  }
}