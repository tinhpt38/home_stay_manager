import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/common/text_input_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/check_out_page_model.dart';
import 'package:home_stay_project/ui/modular/room/room_route.dart';

class CheckOutPage extends StatelessWidget {
  
  TextEditingController _fullNameCotller = TextEditingController();
  TextEditingController _idColler = TextEditingController();
  TextEditingController _phoneColler = TextEditingController();
  TextEditingController _dateLeaveColler = TextEditingController();
  TextEditingController _dateStayColler = TextEditingController();
  TextEditingController _roomColler = TextEditingController();
  TextEditingController _numberOfStayColler = TextEditingController();
  TextEditingController _priceColler = TextEditingController();
  TextEditingController _foodsColler = TextEditingController();
  TextEditingController _drinkColler = TextEditingController();
  TextEditingController _motobikeColler = TextEditingController();
  TextEditingController _infringeColler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BaseWidget<CheckOutPageModel>(
      model: CheckOutPageModel(),
      builder: (context, modle, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Check Out".toUpperCase(),
            style: AppStyle.primaryNavigator,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: FlatButton(
            onPressed: (){
              RoomRoute.goBack(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.primaryColor,),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                        "Create an Check Out",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text(
                      "Fill in infomation customer when check in, please!",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  child: ListView(
                    children: <Widget>[
                      TextInput(
                        cotller: _fullNameCotller,
                        label: "Full Name",
                        hinText: "Join Doe",
                        obscureText: false,
                      ),
                      TextInput(
                        cotller: _idColler,
                        label: "ID",
                        hinText: "235945784",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _phoneColler,
                        label: "Phone Number",
                        hinText: "0352974899",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _dateStayColler,
                        label: "Date Stay",
                        hinText: "29/10/2019",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _dateLeaveColler,
                        label: "Date Leave",
                        hinText: "30/10/2019",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _roomColler,
                        label: "Room",
                        hinText: "Room 1",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _numberOfStayColler,
                        label: "Number of Stay",
                        hinText: "4",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _priceColler,
                        label: "Price",
                        hinText: "3.000.000.VND",
                        obscureText: false,
                      ),
                      TextInput(
                        cotller: _foodsColler,
                        label: "Foods",
                        hinText: "100.000.VND",
                        obscureText: false,
                      ),
                        TextInput(
                        cotller: _drinkColler,
                        label: "Drink",
                        hinText: "90.000.VND",
                        obscureText: false,
                      ),
                      TextInput(
                        cotller: _motobikeColler,
                        label: "Motobike",
                        hinText: "300.000.VND",
                        obscureText: false,
                      ),
                      TextInput(
                        cotller: _infringeColler,
                        label: "Infringe",
                        hinText: "30.000.VND",
                        obscureText: false,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                        child: FullWidthButton(
                        title: "Continue",
                        titleStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                        backgroundColor: AppColor.primaryColor,
                        onClick: (){
                            RoomRoute.openPaymentPage(context);
                        },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}