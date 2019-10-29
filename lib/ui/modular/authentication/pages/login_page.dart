import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_text_input_widget.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/auth_route.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/login_page_model.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';


class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailCotler = TextEditingController();

  TextEditingController _passCotler = TextEditingController();

  TextEditingController _userCotler = TextEditingController();

  Alignment _alignment = Alignment.topCenter;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _alignment = Alignment.bottomCenter;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginPageModel>(
      model: LoginPageModel(),
      builder: (context, model, child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.only(bottom: 16),
                    alignment: _alignment,
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
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: KeyboardAvoider(
                      autoScroll: true,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                          controller: _controller,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: AppInputWidget(
                                label: "",
                                hinText: "User Name",
                                cotller: _userCotler,
                              )
                            ),
                             Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: AppInputWidget(
                                label: "",
                                hinText: "Bussiness Email",
                                cotller:_emailCotler,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: AppInputWidget(
                                label: "",
                                hinText: "Password",
                                obscureText: true,
                                cotller: _passCotler,
                              )
                            ),
                          ],
                      ),
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
                        FullWidthButton(
                          title: "Continue",
                          titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          backgroundColor: AppColor.primaryColor,
                          onClick: (){
                            AuthenticationRoute.openHomePage(context,null);
                          },
                        ),
                         FullWidthButton(
                          title: "Register",
                          titleStyle: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          backgroundColor: Colors.white,
                          border: Border.all(color: AppColor.primaryColor,width: 2),
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