import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/login_action_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/select_button_widget.dart';
import '../auth_route.dart';

class ResgisterPage extends StatelessWidget {
  final role;
  TextEditingController _nameCotller = TextEditingController();
  TextEditingController _emailCotller = TextEditingController();
  TextEditingController _passCotller = TextEditingController();
  TextEditingController _comfirmPassCotller = TextEditingController();
  
  ResgisterPage({this.role});


  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
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
                         child: SingleChildScrollView(
                           child: Column(
                             children: <Widget>[
                                buildTextField(
                          label: "Full Name",
                          hinText: "Join Doe",
                          cotller: _nameCotller,
                          obscureText: false
                        ),
                        buildTextField(
                          label: "Email",
                          hinText: "JoinDoe@gmail.com",
                          cotller: _emailCotller,
                          obscureText: false
                        ),
                        buildTextField(
                          label: "Password",
                          hinText: "",
                          cotller: _passCotller,
                          obscureText: true
                        ),
                          buildTextField(
                          label: "Confirm Password",
                          hinText: "",
                          cotller: _comfirmPassCotller,
                          obscureText: true
                        )
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
                      if(role.toUpperCase() == "ADMIN"){
                        AuthenticationRoute.openAdminSetupRegisget(context, role);
                      }else{
                        AuthenticationRoute.openHomePage(context);
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

  Widget buildTextField({String label, String hinText, TextEditingController cotller, bool obscureText}){
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    label,
                    style: TextStyle(color: AppColor.primaryColor)),
                    ),
                TextField(
                  obscureText: obscureText,
                  controller: cotller,
                  decoration: InputDecoration(
                    hintText: hinText,
                    hintStyle: TextStyle(color: AppColor.primaryColor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor,width: 1)
                      )
                    ),
                ),
              ],
            ),
          );
  }
}