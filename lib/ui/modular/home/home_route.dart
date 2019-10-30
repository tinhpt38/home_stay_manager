import 'package:flutter/widgets.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:home_stay_project/core/model/homestay.dart';

class HomeRoute{
  
  static void openCheckInPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.CheckInPage);
  }

  static void goBack(BuildContext context){
    Navigator.pop(context);
  }

  static void openListRoomPage(BuildContext context, Homestay homestay){
    Navigator.pushNamed(context, RouteName.ListRoomPage, arguments: homestay);
  }
  static void openSettingPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.SettingPage);
  }
  
  static void openCreateSchedulePage(BuildContext context){

  }
}