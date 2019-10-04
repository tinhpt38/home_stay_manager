import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/room/widgets/room_dialog.dart';


class RoomDetailItem extends StatelessWidget {
  const RoomDetailItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8,left: 8),
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle
                ),
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
              ),
              title: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Phan Trung Tinh",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "1 hour ago",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8,left: 72),
            padding: EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 64),
                  margin: EdgeInsets.only(left: 42),
                  child: Text(
                      "Reloaded 3 of 513 libraries in 299ms"
                      +"Reloaded 3 of 513 libraries in 279ms"
                      +"Reloaded 3 of 513 libraries in 302ms"
                      +"Reloaded 0 of 513 libraries in 151ms"
                      +"Reloaded 0 of 513 libraries in 167ms",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => RoomDetailDialog(
                            onDeleteClick: (){

                            },
                            onEditClick: (){
                              
                            },
                          )
                        );
                    },
                    child: Image.asset("assets/dot_menu.png")
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}