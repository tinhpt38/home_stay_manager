import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/staff.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/app_text_input_widget.dart';
import 'package:home_stay_project/ui/common/bottom_error.dart';
import 'package:home_stay_project/ui/modular/authentication/pages_model/admin_setup_page_model.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/login_action_widget.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/select_button_widget.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../auth_route.dart';


class AdminSetupPage extends StatelessWidget {
  final Staff staff;
   TextEditingController _nameCotller = TextEditingController();
  TextEditingController _sologanCotller = TextEditingController();
  TextEditingController _phoneCotller = TextEditingController();
  TextEditingController _numberRoomColler = TextEditingController();
  AdminSetupPage({this.staff});


  bool fillInField(BuildContext context){
    if(_nameCotller.text.isEmpty){
      BottomError.showError(context, "Your homestay name is empty!");
      return false;
    }
    if(_sologanCotller.text.isEmpty){
      BottomError.showError(context, "Your homestay email is empty!");
      return false;
    }
    if(_phoneCotller.text.isEmpty){
      BottomError.showError(context, "Your homestay phone is empty!");
      return false;
    }
     if(_numberRoomColler.text.isEmpty){
      BottomError.showError(context, "Your room number of homestay is empty!");
      return false;
    }
    return true;
  }

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
                            title: staff.role,
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
                          label: "Your Homestay Name",
                          hinText: "Example Homestay",
                          cotller: _nameCotller,
                        ),
                        AppInputWidget(
                          label: "Sologan",
                          hinText: "Example sologan",
                          cotller: _sologanCotller,
                        ),
                        AppInputWidget(
                          label: "Phone",
                          cotller: _phoneCotller,
                          inputType: TextInputType.number,
                        ),
                          AppInputWidget(
                          label: "Number Room Of Homestay",
                          cotller: _numberRoomColler,
                          inputType: TextInputType.number,
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
                        AuthenticationRoute.openHomePage(
                          context,
                          model.createNewHomeStay(
                            _nameCotller.text.trim(), 
                            _sologanCotller.text.trim(),
                            null, 
                            int.parse(_numberRoomColler.text),
                            _phoneCotller.text,
                            staff.email));
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