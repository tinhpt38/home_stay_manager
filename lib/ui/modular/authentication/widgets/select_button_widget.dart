import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class SelectButton extends StatefulWidget {
  
  final String title;
  final Function(String) onSelected;
  bool isSelected;

  SelectButton({this.title, this.onSelected, this.isSelected});

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        widget.onSelected(widget.title);
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width *(1/3),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: !widget.isSelected? Colors.white:AppColor.primaryColor,
          border: Border.all(
            color: !widget.isSelected? AppColor.primaryColor: Colors.transparent,
            width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Text(
          widget.title.toUpperCase(),
          style: TextStyle(
            color: widget.isSelected?Colors.white:AppColor.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}