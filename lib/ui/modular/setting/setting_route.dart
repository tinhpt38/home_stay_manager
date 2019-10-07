import 'package:flutter/widgets.dart';
import 'package:home_stay_project/core/constant/route_name.dart';

class SettingRoute{
  static void goBack(BuildContext context){
    Navigator.pop(context);
  }

  static void openAboutUsPage(BuildContext context){
    Navigator.pushNamed(context, RouteName.AboutUsPage);
  }
}