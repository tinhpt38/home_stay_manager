import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';


class RoomDetailDialog extends StatelessWidget {

  Function onEditClick;
  Function onDeleteClick;

  RoomDetailDialog({this.onEditClick, this.onDeleteClick})    ;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * (1/3),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Select Action",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColor.primaryColor
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: FullWidthButton(
              title: "Edit".toUpperCase(),
              backgroundColor: AppColor.primaryColor,
              titleStyle: TextStyle(
                color: Colors.white
              ),
              onClick: (){
                  onEditClick();
              },
            ),
          ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 24),
             child: FullWidthButton(
              title: "Delete".toUpperCase(),
              backgroundColor: AppColor.primaryColor,
              titleStyle: TextStyle(
                color: Colors.white
              ),
              onClick: (){
                onDeleteClick();
              },
          ),
           ),
        ],
      ),
    );
  }
}