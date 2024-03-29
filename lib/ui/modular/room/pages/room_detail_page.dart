import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/room_detail_page_model.dart';
import 'package:home_stay_project/ui/modular/room/room_route.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/modular/room/widgets/room_detail_item_widget.dart';
import 'package:provider/provider.dart';

class RoomDetailPage extends StatelessWidget {
  final Room room;
  RoomDetailPage({this.room});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController _historyCotler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RoomDetailPageModel>(
      model: RoomDetailPageModel(service: Provider.of(context), room: room),
      builder: (context, model, chil) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              room.title,
              style: AppStyle.primaryNavigator,
            ),
            leading: FlatButton(
              onPressed: () {
                RoomRoute.openListRoom(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.primaryColor,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: AppColor.primaryColor,
                ),
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
          ),
          body: WillPopScope(
            onWillPop: () {
              RoomRoute.openListRoom(context);
            },
            child: Container(
                child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    margin: EdgeInsets.only(top: 8, left: 24, right: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: TextField(
                      controller: _historyCotler,
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        icon: SizedBox(
                          width: 28,
                          height: 28,
                          child: Image.asset("assets/search.png"),
                        ),
                        hintText: "History",
                        hintStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                      ),
                    )),
                Expanded(flex: 1, child: buildBody()),
              ],
            )),
          ),
          drawer: Drawer(
            child: Container(
              color: AppColor.primaryColor,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                    ),
                    child: Container(
                        child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        model.home.name,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        model.home.sologan,
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: FullWidthButton(
                      title: "Check in",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                      backgroundColor: AppColor.secondaryColor,
                      onClick: () {
                        RoomRoute.openCheckInPage(context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: FullWidthButton(
                      title: "Clear Room",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                      backgroundColor: AppColor.secondaryColor,
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return this.room.details == null ? buildEmpty() : buildData();
  }

  Widget buildEmpty() {
    return Container(
      alignment: Alignment.center,
      child: Text("Loading..."),
    );
  }

  Widget buildData() {
    List<Detail> temp = room.details;
    temp = temp.reversed.toList();
    return ListView.builder(
      itemCount: temp.length,
      itemBuilder: (context, index) {
        return RoomDetailItem(
          detail: temp[index],
          onClick: () {
            if (!room.details[index].isCheckOut) {
              RoomRoute.openCheckOutPage(context, room, room.details[index]);
            }
          },
        );
      },
    );
  }
}
