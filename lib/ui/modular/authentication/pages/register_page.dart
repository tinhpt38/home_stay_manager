import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/app_text_input_widget.dart';
import 'package:home_stay_project/ui/common/bottom_error.dart';
import 'package:home_stay_project/ui/common/regexp.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/register_page_model.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/login_action_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/select_button_widget.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import '../auth_route.dart';

class ResgisterPage extends StatelessWidget {
  final role;
  TextEditingController _nameCotller = TextEditingController();
  TextEditingController _emailCotller = TextEditingController();
  TextEditingController _passCotller = TextEditingController();
  TextEditingController _comfirmPassCotller = TextEditingController();
  
  ResgisterPage({this.role});


  bool fillInField(BuildContext context){
    if(_nameCotller.text.isEmpty){
      BottomError.showError(context, "Full Name is empty");
      return false;
    } 
    if(_emailCotller.text.isEmpty){
      BottomError.showError(context, "Email is empty");
      return false;
    }
    if(_passCotller.text.isEmpty){
      BottomError.showError(context, "Password is empty");
      return false;
    }
    if(_comfirmPassCotller.text.isEmpty){
      BottomError.showError(context, "Typing confirm password field");
      return false;
    }
    if(_passCotller.text != _comfirmPassCotller.text){
      BottomError.showError(context, "Your password dosen't match. Try again!");
      return false;
    }
    String email = _emailCotller.text;
    bool emailValid = emailRegExp.hasMatch(email);
    if(!emailValid){
      BottomError.showError(context, "Email is error formatter!");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<RegisterPageModel>(
      model: RegisterPageModel(),
      builder: (context, model, child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
            appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Register".toUpperCase(),
              style: AppStyle.primaryNavigator
            ),
            leading: FlatButton(
              onPressed: (){
                AuthenticationRoute.goBack(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: SelectButton(
                            title: role,
                            isSelected: false,
                            onSelected: (title){},
                          ),
                        ),
                       Expanded(
                         child: KeyboardAvoider(
                           autoScroll: true,
                           child: ListView(
                             controller: ScrollController(),
                             physics: BouncingScrollPhysics(),
                             children: <Widget>[
                                AppInputWidget(
                          label: "Full Name",
                          hinText: "Join Doe",
                          cotller: _nameCotller,
                        ),
                        AppInputWidget(
                          label: "Email",
                          hinText: "JoinDoe@example.com",
                          cotller: _emailCotller,
                        ),
                        AppInputWidget(
                          label: "Password",
                          cotller: _passCotller,
                          obscureText: true,
                        ),
                          AppInputWidget(
                          label: "Confirm Password",
                          cotller: _comfirmPassCotller,
                          obscureText: true
                        ),
                             ],
                           ),
                         ),
                       ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AuthAction(
                    onContinueClick: (){
                      if(fillInField(context)){
                        if(role.toUpperCase() == "ADMIN"){
                            AuthenticationRoute.openAdminSetupRegisget(
                              context,
                              model.createStaff(
                                _nameCotller.text.trim(),
                                _emailCotller.text.trim(),
                                role,
                                _passCotller.text.trim()));
                          }else{
                            AuthenticationRoute.openHomePage(context);
                          }
                      }
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