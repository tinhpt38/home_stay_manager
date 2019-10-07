import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/info_widget.dart';
import 'package:home_stay_project/ui/modular/home/home_route.dart';
import 'package:home_stay_project/ui/modular/home/widget/home_square_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      widgetDidLoad: (){},
      model: NullablePageModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: InfoWidget(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView(
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
                              HomeRoute.openListRoomPage(context);
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
    );
  }

}