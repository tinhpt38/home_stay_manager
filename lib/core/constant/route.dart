
import 'package:flutter/material.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/admin_setup.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/login_page.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/register_page.dart';
import 'package:home_stay_project/ui/modular/authentication/pages/select_role_page.dart';
import 'package:home_stay_project/ui/modular/home/pages/home_page.dart';
import 'package:home_stay_project/ui/modular/landing/pages/landing_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/check_in_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/check_out_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/list_room_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/payment_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/rating_page.dart';
import 'package:home_stay_project/ui/modular/room/pages/room_detail_page.dart';
import 'package:home_stay_project/ui/modular/setting/pages/about_us_page.dart';
import 'package:home_stay_project/ui/modular/setting/pages/setting_page.dart';

Route route(RouteSettings settings){
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
    Staff staff = settings.arguments as Staff;
    return MaterialPageRoute(builder: (_) => AdminSetupPage(staff: staff));
    case RouteName.HomePage:
    return MaterialPageRoute(builder: (_) => HomePage());
    case RouteName.ListRoomPage:
    return MaterialPageRoute(builder: (_) => ListRoomPage());
    case RouteName.RoomDetailPage:
    Room room = settings.arguments as Room;
    return MaterialPageRoute(builder: (_) => RoomDetailPage(room: room,));
    case RouteName.CheckInPage:
    return MaterialPageRoute(builder: (_) => CheckInPage());
    case RouteName.CheckOutPage:
    var data = settings.arguments;
    return MaterialPageRoute(builder: (_) => CheckOutPage(data: data,));
    case RouteName.PaymentPage:
    var data = settings.arguments;
    return MaterialPageRoute(builder: (_) => PaymentPage(data: data));
    case RouteName.SettingPage:
    return MaterialPageRoute(builder: (_) => SettingPage());
    case RouteName.AboutUsPage:
    return MaterialPageRoute(builder: (_) => AboutUsPage());
    case RouteName.RatingPage:
    return MaterialPageRoute(builder: (_) => RatingPage());
  }
}