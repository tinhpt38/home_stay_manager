import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class RoomItem extends StatefulWidget {

  final Function(String) onRoomClick;
  
  RoomItem({this.onRoomClick});

  @override
  _RoomItemState createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
      _opacity = 1;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 2),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor
        ),
        child: ListTile(
          onTap: (){
            widget.onRoomClick("Room 1");
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
      ),
    );
  }
}