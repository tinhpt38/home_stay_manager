
import 'package:flutter/material.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/admin_setup.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/login_page.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/register_page.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/select_role_page.dart';
import 'package:home_stay_project/ui/modular/home/pages/home_page.dart';
import 'package:home_stay_project/ui/modular/landing/pages/landing_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/list_room_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/room_detail_page.dart';

Route<dynamic> route(RouteSettings settings){
  switch(settings.name){
    case RouteName.LandingPage:
    return MaterialPageRoute(builder: (_) => LandingPage());
    case RouteName.LoginPage:
    return MaterialPageRoute(builder: (_) => LoginPage());
    case RouteName.SelectRolePage:
    return MaterialPageRoute(builder: (_) => SelectRolePage());
    case RouteName.ResigterPage:
    String role = settings.arguments as String;
    return MaterialPageRoute(builder: (_) => ResgisterPage(role: role));
    case RouteName.AdminSetupPage:
    String role = settings.arguments as String;
    return MaterialPageRoute(builder: (_) => AdminSetupPage(role: role));
    case RouteName.HomePage:
    return MaterialPageRoute(builder: (_) => HomePage());
    case RouteName.ListRoomPage:
    return MaterialPageRoute(builder: (_) => ListRoomPage());
    case RouteName.RoomDetailPage:
    return MaterialPageRoute(builder: (_) => RoomDetailPage());
  }
}