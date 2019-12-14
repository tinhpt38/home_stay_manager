import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/room/widgets/room_dialog.dart';

class RoomDetailItem extends StatelessWidget {
  final Function onClick;
  final Detail detail;

  RoomDetailItem({this.onClick, this.detail});

  Color _textColor = AppColor.primaryColor;


  @override
  Widget build(BuildContext context) {
    _textColor = detail.isCheckOut?Colors.grey:AppColor.primaryColor;
    return Container(
      width: double.infinity,
          child: GestureDetector(
            onTap: onClick,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8, left: 8),
                  child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: _textColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                      title: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              detail.customer.name,
                              style: TextStyle(
                                  color: _textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                detail.customer.inAt,
                                style: TextStyle(
                                    color: _textColor, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 8, left: 72, right: 12),
                  padding: EdgeInsets.only(top: 32),
                  decoration: BoxDecoration(color: AppColor.secondaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 32),
                        margin: EdgeInsets.only(left: 12),
                        child: Text(
                          detail.customer.info(),
                          style: TextStyle(
                              color: _textColor, fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      RoomDetailDialog(
                                        onDeleteClick: () {},
                                        onEditClick: () {},
                                      ));
                            },
                            child: Image.asset("assets/dot_menu.png")),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
