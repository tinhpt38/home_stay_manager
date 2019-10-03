import 'package:flutter/material.dart';


class RadiusButton extends StatelessWidget {

  final VoidCallback onClick;
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final Border border;

  RadiusButton({this.backgroundColor, this.textColor, this.onClick, this.title, this.border});
  
  @override
  Widget build(BuildContext context) {
    Color _color = backgroundColor == null? Colors.transparent: backgroundColor;
    Border _border = border == null ? Border.all(color: backgroundColor,width: 2): border;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width:  double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: _border,
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(45))
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}