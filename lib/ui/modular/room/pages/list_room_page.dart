import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/home/home_route.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/list_room_page_model.dart';
import 'package:home_stay_project/ui/modular/room/room_route.dart';
import 'package:home_stay_project/ui/modular/room/widgets/room_item_widget.dart';


class ListRoomPage extends StatefulWidget {
  
  Homestay homestay;

  ListRoomPage({this.homestay});
  
  @override
  _ListRoomPageState createState() => _ListRoomPageState();
}

class _ListRoomPageState extends State<ListRoomPage> {
  Alignment _alignment  = Alignment.bottomCenter;
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _alignment = Alignment.center;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ListRoomPageModel>(
      model: ListRoomPageModel(widget.homestay),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: FlatButton(
            onPressed: (){
              HomeRoute.goBack(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.primaryColor,),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: AppColor.secondaryColor,
                  alignment: _alignment,
                  child: Row(
                   children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 32),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          shape: BoxShape.circle
                        ),
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 32),
                        child: Text(
                          model.home.name,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      )
                   ],
                 ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: model.home.roomNumber,
                    itemBuilder: (context,index){
                      return Container(
                        child: RoomItem(
                          room: model.home.rooms[index],
                          onRoomClick: (title){
                            RoomRoute.openRoomDetail(context, model.home.rooms[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}