import 'package:flutter/material.dart';

import 'app_colors.dart';


class FullWidthButton extends StatelessWidget {

  final String title;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final VoidCallback onClick;

  FullWidthButton({this.backgroundColor, this.title, this.titleStyle, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Text(
                  title.toUpperCase(),
                  style: titleStyle
                ),
              ),
            );
  }
}