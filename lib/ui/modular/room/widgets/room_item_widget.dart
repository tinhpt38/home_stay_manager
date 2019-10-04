import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';


class RoomItem extends StatelessWidget {
  const RoomItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: size.width * (1/20),
              height: size.width * (1/20),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Room 1",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Busy",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 14
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: (){},
              child: Icon(Icons.arrow_right,color: AppColor.primaryColor,),
            ),
          ),
        ],
      ),
    );
  }
}