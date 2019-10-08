import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/info_widget.dart';
import 'package:home_stay_project/ui/modular/setting/setting_route.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  double _width = 10;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(Duration(seconds: 1),(){
          setState(() => _width = MediaQuery.of(context).size.width - 64);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      model: NullablePageModel(),
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
          centerTitle: true,
          title: Text(
            "About us".toUpperCase(),
            style: AppStyle.primaryNavigator,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: FlatButton(
            onPressed: (){
              SettingRoute.goBack(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.primaryColor,),
          ),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Developer",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              buildAboutItem(
                name: "Phan Trung Tinh",
                profile: "Flutter Developer"
              ),
              buildAboutItem(
                name: "Tran Trong Hiep",
                profile: "Backend Developer"
              ),
            ],
          ),
        ),
        );
      },
    );
  }

  Widget buildAboutItem({String name, String profile}){
    return Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: <Widget>[
                InfoWidget(
                  name: name,
                  profile: profile,
                ),
                AnimatedContainer(
                duration: Duration(seconds: 2),
                width: _width,
                height: 2,
                color: AppColor.primaryColor,
                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                )
              ],
            ),
          );
  }
}