import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class RoomItem extends StatefulWidget {

  Room room;

  final Function(String) onRoomClick;
  
  RoomItem({this.onRoomClick, this.room});

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
            widget.onRoomClick(widget.room.title);
          },
          leading: Container(
            width: size.width * (1/20),
            height: size.width * (1/20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColorFromSate(widget.room.state)
            ),
          ),
          trailing: Container(
            child: Icon(
              Icons.arrow_right,
              color: AppColor.primaryColor,
            ),
          ),
          title: Text(
            widget.room.title,
            style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text(
            widget.room.state.toString().split(".")[1],
            style: TextStyle(
              fontSize: 14,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ),
    );
  }

  Color getColorFromSate(RoomState state){
    if(state == RoomState.clean){
      return Colors.green;
    }
    if( state == RoomState.busy){
      return Colors.red;
    }
    if (state == RoomState.watting){
      return Colors.orange;
    }
  }
}