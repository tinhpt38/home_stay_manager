import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class HomeSquareButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final EdgeInsets margin;
  HomeSquareButton({this.title, this.onClick, this.margin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: margin,
          alignment: Alignment.center,
          color: AppColor.secondaryColor,
          child: GestureDetector(
            onTap: onClick,
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}