

import 'package:flutter/material.dart';
import 'package:home_stay_project/core/constant/route_name.dart';

class RoomRoute{
  static void goBack(BuildContext context){
    Navigator.pop(context);
  }
  
  static void openRoomDetail(BuildContext context){
    Navigator.pushNamed(context, RouteName.RoomDetailPage);
  }

  static void openCheckInPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.CheckInPage);
  }

  static void openCheckOutPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.CheckOutPage);
  }
  
  static void openPaymentPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.PaymentPage);
  }
}