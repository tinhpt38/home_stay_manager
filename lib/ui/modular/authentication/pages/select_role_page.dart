import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/bottom_error.dart';
import 'package:home_stay_project/ui/modular/authentication/auth_route.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/group_select_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/login_action_widget.dart';


class SelectRolePage extends StatelessWidget {

  String _role = "";



  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Select Role".toUpperCase(),
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
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: GroupSelectButton(
                    titles: ["Admin","Reception","House Keeping"],
                    onSelected: (title){
                      _role = title;
                  },
                ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AuthAction(
                      onContinueClick: (){
                        if(_role.isEmpty){
                            BottomError.showError(context,"You have select one role for your account");
                        }else{
                          AuthenticationRoute.openRegisterPage(context, _role);
                        }
                        
                    },),
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