import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/modular/home/home_route.dart';
import 'package:home_stay_project/ui/modular/room/widgets/room_item_widget.dart';


class ListRoomPage extends StatelessWidget {

  List<String> rooms = List.generate(12, (i) => "Room {i}");
  
  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      model: NullablePageModel(),
      builder: (context, modle, child) => Scaffold(
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
                child: Container(
                  color: AppColor.secondaryColor,
                  child: Row(
                   children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 32),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColor.borderColor,
                          shape: BoxShape.circle
                        ),
                        child: Icon(
                          Icons.people,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Container(
                         margin: EdgeInsets.only(left: 32),
                        child: Text(
                          "List Room",
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
                    itemCount: rooms.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: RoomItem(),
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