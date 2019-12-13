import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_stay_project/core/constant/provider.dart';
import 'package:home_stay_project/core/constant/route.dart';
import 'package:home_stay_project/core/constant/route_name.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: "Home Stay Manager",
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.LandingPage,
        onGenerateRoute: route,
      ),
    );
  }
}

