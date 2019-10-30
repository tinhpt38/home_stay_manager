import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/info_widget.dart';
import 'package:home_stay_project/ui/modular/home/home_route.dart';
import 'package:home_stay_project/ui/modular/home/pages_model/home_page_model.dart';
import 'package:home_stay_project/ui/modular/home/widget/home_square_button.dart';


class HomePage extends StatelessWidget {
  final Homestay homeStay;
  const HomePage({this.homeStay, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePageModel>(
      model: HomePageModel(homeStay),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: InfoWidget(
                    name: model.home.name,
                    profile: model.home.sologan,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          HomeSquareButton(
                            title: "Check in",
                            margin: EdgeInsets.only(left: 16,right: 8,top: 8,bottom: 8),
                            onClick: (){
                              HomeRoute.openCheckInPage(context);
                            },
                          ),
                           HomeSquareButton(
                            title: "List Room",
                            margin: EdgeInsets.only(right: 16,left: 8,top: 8,bottom: 8),
                            onClick: (){
                              HomeRoute.openListRoomPage(context, model.home);
                            },
                          )
                        ],
                      ),
                        Row(
                        children: <Widget>[
                          HomeSquareButton(
                            title: "Create Schedule House Kepping",
                            margin: EdgeInsets.only(left: 16,right: 8,bottom: 8,top: 8),
                            onClick: (){},
                          ),
                           HomeSquareButton(
                            title: "Setting",
                            margin: EdgeInsets.only(right: 16,left: 8,bottom: 8,top: 8),
                            onClick: (){
                              HomeRoute.openSettingPage(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
            ),
        ),
      ),
    );
  }

}