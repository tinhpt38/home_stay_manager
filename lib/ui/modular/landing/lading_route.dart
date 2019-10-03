import 'package:flutter/widgets.dart';
import 'package:home_stay_project/core/constant/route_name.dart';

class LandingRoute {
  static void openLoginPage(BuildContext context){
    Navigator.pushReplacementNamed(context, RouteName.LoginPage);
  }
}