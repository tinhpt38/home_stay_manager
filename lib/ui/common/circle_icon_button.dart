import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class CircleIconButton extends StatelessWidget {
  final String asset;
  final VoidCallback onClick;

  CircleIconButton({this.asset, this.onClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.borderColor, width: 1)
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          width: size.width * (1/6),
          child: Image.asset(asset),
        ),
      ),
    );
  }
}