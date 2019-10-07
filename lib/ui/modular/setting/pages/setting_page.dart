import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/common/info_widget.dart';
import 'package:home_stay_project/ui/modular/setting/setting_route.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      model: NullablePageModel(),
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Setting".toUpperCase(),
              style: AppStyle.primaryNavigator,
            ),
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: FlatButton(
              onPressed: (){
                SettingRoute.goBack(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.primaryColor,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  SettingRoute.openAboutUsPage(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.borderColor,
                    shape: BoxShape.circle
                  ),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset("assets/app_logo.png"),
                  ),
                )
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  child: InfoWidget(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.borderColor,
                      width: 2
                    )
                  ),
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: Text(
                      "Edit".toUpperCase(),
                      style: TextStyle(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: FullWidthButton(
                    title: "Logout",
                    titleStyle: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                    ),
                    backgroundColor: AppColor.secondaryColor,
                    onClick: (){

                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}