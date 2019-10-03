import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColor.borderColor,
              shape: BoxShape.circle
            ),
            child: Icon(
              Icons.people,
              color: AppColor.primaryColor,
              size: 48,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Join Doe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Hi! My name is John, I’m a creative geek from San Francisco, CA. Contact me at john@mail.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.borderColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}