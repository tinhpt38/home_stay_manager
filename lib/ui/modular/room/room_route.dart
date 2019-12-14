

import 'package:flutter/material.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:home_stay_project/core/model/room.dart';

class RoomRoute{
  static void goBack(BuildContext context){
    Navigator.pop(context);
  }
  
  static void openRoomDetail(BuildContext context, Room room){
    Navigator.pushNamed(context, RouteName.RoomDetailPage, arguments: room);
  }

  static void openCheckInPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.CheckInPage);
  }

  static void openCheckOutPage(BuildContext context,Room room, Detail detail){
    var data = {
      "detail":detail,
      "room":room
    };
    Navigator.pushNamed(context, RouteName.CheckOutPage, arguments: data);
  }
  
  static void openPaymentPage(BuildContext context, Detail detail, int indexRoom){
     var data = {
      "detail":detail,
      "indexRoom":indexRoom
    };
    Navigator.pushNamed(context, RouteName.PaymentPage, arguments: data);
  }

  static void openRatingPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.RatingPage);
  }

  static void openListRoom(BuildContext context){
    Navigator.pushReplacementNamed(context, RouteName.ListRoomPage);
  }
}