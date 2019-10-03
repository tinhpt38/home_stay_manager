import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/radius_button.dart';
import 'package:home_stay_project/ui/modular/authentication/auth_route.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/login_page_model.dart';



class LoginPage extends StatelessWidget {
  
  TextEditingController _emailCotler = TextEditingController();
  TextEditingController _passCotler = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return BaseWidget<LoginPageModel>(
      model: LoginPageModel(),
      widgetDidLoad:(){

      },
      builder: (context, model, child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.only(bottom: 16),
                    alignment: Alignment.bottomCenter,
                    color: AppColor.primaryColor,
                    child: Text(
                      "Homestay manager".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: TextField(
                              controller: _emailCotler,
                              style: TextStyle(color: AppColor.primaryColor,fontSize: 20),
                              decoration: InputDecoration(
                                hintText: "email",
                                hintStyle: TextStyle(
                                  color: AppColor.primaryColor
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(45),
                                  borderSide: BorderSide(color: AppColor.borderColor,width: 2)
                                )
                              ),
                            ),
                          ),
                           Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            child: TextField(
                              controller: _passCotler,
                              obscureText: true,
                              style: TextStyle(color:AppColor.primaryColor,fontSize: 20),
                              decoration: InputDecoration(
                                hintText: "password",
                                hintStyle: TextStyle(
                                  color: AppColor.primaryColor
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(45),
                                  borderSide: BorderSide(color: AppColor.borderColor,width: 2)
                                )
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFAADC9),
                              borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                            width: size.width / 10,
                            height: 5,
                          )
                        ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RadiusButton(
                          border: null,
                          backgroundColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          title: "Continue",
                          onClick: (){
                            AuthenticationRoute.openHomePage(context);
                          },
                        ),
                          RadiusButton(
                          backgroundColor: null,
                          border: Border.all(color: AppColor.primaryColor, width: 2),
                          textColor: AppColor.primaryColor,
                          title: "Register",
                          onClick: (){
                            AuthenticationRoute.openSelectRolePage(context);
                          },
                        ),
                      ],
                    ),
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