import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/landing/lading_route.dart';
import 'package:home_stay_project/ui/modular/landing/pages_model/landing_page_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  double _widthLogo = 0;
  double _opacity = 0;
  Alignment _aligment = Alignment.bottomCenter;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _widthLogo = MediaQuery.of(context).size.width * (1/2);
        _opacity = 1;
        _aligment = Alignment.center;
      });
   Future.delayed(Duration(seconds: 2),(){
          LandingRoute.openLoginPage(context);
          // LandingRoute.openHomePage(context);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget<LandingPageModel>(
      builder: (context, model, child){
        return Scaffold(
          body: Container(
            width: double.infinity,
            color: AppColor.secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: AnimatedOpacity(
                      opacity: _opacity,
                      duration: Duration(seconds: 2),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      alignment: _aligment,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            width: _widthLogo,
                            child: Image.asset("assets/app_logo.png"),
                          ),
                          Container(
                            child: Text(
                              "Homestay \n Manager",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 42,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: _opacity,
                    child: Container(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    alignment: Alignment.center,
                    child: Text(
                      "By creating an account your agree to our\nTerms of Service and Privacy Policy",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ),
        );
      },
    );
  }
}