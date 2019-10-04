import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class RoomItem extends StatelessWidget {

  final Function(String) onRoomClick;
  
  RoomItem({this.onRoomClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor
      ),
      child: ListTile(
        onTap: (){
          onRoomClick("Room 1");
        },
        leading: Container(
          width: size.width * (1/20),
          height: size.width * (1/20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red
          ),
        ),
        trailing: Container(
          child: Icon(
            Icons.arrow_right,
            color: AppColor.primaryColor,
          ),
        ),
        title: Text(
          "Room 1",
          style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          "Busy",
          style: TextStyle(
            fontSize: 14,
            color: AppColor.primaryColor,
          ),
        ),
      )
    );
  }
}