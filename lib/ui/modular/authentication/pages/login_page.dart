import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/common/text_input_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/auth_route.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/login_page_model.dart';



class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailCotler = TextEditingController();

  TextEditingController _passCotler = TextEditingController();

  TextEditingController _userCotler = TextEditingController();

  double _width = 0;
  Alignment _alignment = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _width = MediaQuery.of(context).size.width;
        _alignment = Alignment.bottomCenter;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget<LoginPageModel>(
      model: LoginPageModel(),
      builder: (context, model, child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
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
                  flex: 3,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: TextInput(
                                label: "",
                                hinText: "User Name",
                                obscureText: false,
                                cotller: _userCotler,
                              )
                            ),
                             Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: TextInput(
                                label: "",
                                hinText: "Bussiness Email",
                                obscureText: false,
                                cotller:_emailCotler,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: TextInput(
                                label: "",
                                hinText: "Password",
                                obscureText: true,
                                cotller: _passCotler,
                              )
                            ),
                            AnimatedContainer(
                              margin: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                              duration: Duration(seconds: 2),
                              decoration: BoxDecoration(
                                color: AppColor.lineColor,
                                borderRadius: BorderRadius.all(Radius.circular(45))
                              ),
                              width: _width,
                              height: 5,
                            )
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
                            AuthenticationRoute.openHomePage(context);
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