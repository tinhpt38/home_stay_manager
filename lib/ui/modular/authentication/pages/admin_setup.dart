import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/text_input_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/admin_setup_page_model.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/login_action_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/select_button_widget.dart';

import '../auth_route.dart';


class AdminSetupPage extends StatelessWidget {
  final String role;
   TextEditingController _nameCotller = TextEditingController();
  TextEditingController _emailCotller = TextEditingController();
  TextEditingController _passCotller = TextEditingController();
  TextEditingController _comfirmPassCotller = TextEditingController();
  AdminSetupPage({this.role});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AdminSetupPageModel>(
      model: AdminSetupPageModel(),
      builder: (context, model, child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
            appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Admin Setup".toUpperCase(),
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
                                TextInput(
                          label: "Your Homestay Name",
                          hinText: "PiLaka Homestay",
                          cotller: _nameCotller,
                          obscureText: false
                        ),
                        TextInput(
                          label: "Sologan",
                          hinText: "PiLaka Happy",
                          cotller: _emailCotller,
                          obscureText: false
                        ),
                        TextInput(
                          label: "Phone",
                          hinText: "",
                          cotller: _passCotller,
                          obscureText: false
                        ),
                          TextInput(
                          label: "Number Room Of Homestay",
                          hinText: "",
                          cotller: _comfirmPassCotller,
                          obscureText: false
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
                      AuthenticationRoute.openHomePage(context);
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