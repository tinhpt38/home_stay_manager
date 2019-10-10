import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


Widget loadingWidget(){
  return Container(
    child: Column(
      children: <Widget>[
        CircularProgressIndicator(
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Text(
            "Empty",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
        ),
      ],
    ),
  );
}

Widget emptyWidget(){
  return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Text(
            "Empty",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
        );
}