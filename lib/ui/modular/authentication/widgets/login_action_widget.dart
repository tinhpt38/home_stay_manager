import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/circle_icon_button.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/auth_route.dart';


class AuthAction extends StatelessWidget {
  final VoidCallback onContinueClick;

  AuthAction({this.onContinueClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: FullWidthButton(
              backgroundColor: AppColor.primaryColor,
              title: "Continue",
              titleStyle: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
              onClick:onContinueClick,
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleIconButton(
                  asset: "assets/facebook_logo.png",
                  onClick: (){},
                ),
                CircleIconButton(
                  asset: "assets/google_logo.png",
                  onClick: (){},
                ),
                CircleIconButton(
                  asset: "assets/twitter_logo.png",
                  onClick: (){},
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              "Already have an account?",
              style: TextStyle(
                color: AppColor.primaryColor
              ),
            ),
          ),
          Container(
            child: FullWidthButton(
              title: "LOGIN",
              titleStyle: TextStyle(
                fontSize: 16,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold
              ),
              backgroundColor: AppColor.secondaryColor,
              onClick: (){
                AuthenticationRoute.goBack(context);
              },
            ),
          ),
        ],
      ),
    );
  }


}