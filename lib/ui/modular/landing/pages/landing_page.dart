import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/landing/lading_route.dart';
import 'package:home_stay_project/ui/modular/landing/pages_model/landing_page_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget<LandingPageModel>(
      widgetDidLoad: (){
        LandingRoute.openLoginPage(context);
      },
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
                    child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: size.width /2,
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  alignment: Alignment.center,
                  child: Text(
                    "By creating an account your agree to our\nTerms of Service and Privacy Policy",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
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