import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class AppInputWidget extends StatelessWidget {

  final String label;
  final bool obscureText;
  final String hinText;
  final TextEditingController cotller;
  TextInputType inputType;
  bool isEnable = true;

  AppInputWidget({this.label, this.obscureText = false, this.hinText = "", this.cotller, this.inputType = TextInputType.text, this.isEnable});


  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
                label,
                style: TextStyle(color: AppColor.primaryColor,fontSize: 14)),
          ),
          TextField(
            obscureText: obscureText,
            controller: cotller,
            keyboardType: inputType,
            enabled: isEnable,
            decoration: InputDecoration(
                hintText: hinText,
                hintStyle: TextStyle(color: AppColor.primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor,width: 1),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor,width: 2),
                )
            ),
          ),
        ],
      ),
    );
  }
}