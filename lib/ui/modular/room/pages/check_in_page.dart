import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/core/model/customer.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/app_text_input_widget.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/checkin_page_model.dart';
import 'package:home_stay_project/ui/modular/room/room_route.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:provider/provider.dart';

class CheckInPage extends StatefulWidget {
  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  TextEditingController _fullNameCotller = TextEditingController();

  TextEditingController _idColler = TextEditingController();

  TextEditingController _phoneColler = TextEditingController();

  TextEditingController _dateLeaveColler = TextEditingController();

  TextEditingController _dateStayColler = TextEditingController();

  TextEditingController _roomColler = TextEditingController();

  TextEditingController _numberOfStayColler = TextEditingController();

  TextEditingController _priceColler = TextEditingController();

  List<TextEditingController> cotlers = List();

  CheckInPageModel _model;

  @override
  void initState() {
    cotlers = [
      _fullNameCotller,
      _idColler,
      _phoneColler,
      _dateStayColler,
      _dateLeaveColler,
      _roomColler,
      _numberOfStayColler,
      _priceColler
    ];
    super.initState();
  }

  valideField() {
    cotlers.forEach((cotler) {
      if (cotler.text == "" || cotler.text == null) {
        return false;
      }
    });
    return true;
  }

  onContinueClick(BuildContext context) {
    if (!valideField()) {
      showErr(context, "Một trong các trường đang trống!");
    } else {
      try{
        int index = int.parse(_roomColler.text);
        _model.getRoom(index);
        Room room = _model.room;
        Detail detail = createDetail(context);
        room.details.add(detail);
        _model.setDetail(detail, index);
        RoomRoute.openRoomDetail(context, room);
      }on Exception catch (e){
        showErr(context, "Phòng bạn nhập không hợp lệ!");
      }
    }
  }

  createPrice(BuildContext context) {
    try {
      double price = double.parse(_priceColler.text.trim());
      return Price(price: price, title: "Room");
    } catch (e) {
      showErr(context, "Giá nhập vào không đúng định dạng");
    }
  }

  createDetail(BuildContext context) {
    Price price = createPrice(context);
    return Detail(
      numberPeople: int.parse(_numberOfStayColler.text),
      customer: createCustomer(),
      prices: [price],
    );
  }

  checkDate(){
    try{
      DateTime inAt = DateTime.parse(_dateStayColler.text);
      DateTime outAt = DateTime.parse(_dateLeaveColler.text);

      // if(outAt <inAt){
        
      // }
    } on Exception catch(e){

    }
  }

  createCustomer() {
    return Customer(
      name: _fullNameCotller.text.trim(),
      id: _idColler.text.trim(),
      phone: _phoneColler.text.trim(),
      inAt: _dateStayColler.text.trim(),
      outAt: _dateLeaveColler.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CheckInPageModel>(
      model: CheckInPageModel(service: Provider.of(context)),
      builder: (context, model, child){
        _model = model;
        return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Check In".toUpperCase(),
            style: AppStyle.primaryNavigator,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: FlatButton(
            onPressed: () {
              RoomRoute.goBack(context);
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Create an Check In",
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Fill in infomation customer when check in, please!",
                      style:
                          TextStyle(color: AppColor.primaryColor, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  child: KeyboardAvoider(
                    autoScroll: true,
                    child: ListView(
                      controller: ScrollController(),
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        AppInputWidget(
                          cotller: _fullNameCotller,
                          label: "Full Name",
                          hinText: "Join Doe",
                          obscureText: false,
                        ),
                        AppInputWidget(
                          cotller: _idColler,
                          label: "ID",
                          hinText: "235945784",
                          obscureText: false,
                          inputType: TextInputType.number,
                        ),
                        AppInputWidget(
                          cotller: _phoneColler,
                          label: "Phone Number",
                          hinText: "0352974899",
                          obscureText: false,
                          inputType: TextInputType.number,

                        ),
                        AppInputWidget(
                          cotller: _dateStayColler,
                          label: "Date Stay",
                          hinText: "29-10-2019",
                          obscureText: false,
                        ),
                        AppInputWidget(
                          cotller: _dateLeaveColler,
                          label: "Date Leave",
                          hinText: "30-10-2019",
                          obscureText: false,
                        ),
                        AppInputWidget(
                          cotller: _roomColler,
                          label: "Room",
                          hinText: "1",
                          obscureText: false,
                          inputType: TextInputType.number,
                        ),
                        AppInputWidget(
                          cotller: _numberOfStayColler,
                          label: "Number of Stay",
                          hinText: "4",
                          obscureText: false,
                          inputType: TextInputType.number,
                        ),
                        AppInputWidget(
                          cotller: _priceColler,
                          label: "Price",
                          hinText: "3.000.000.VND",
                          obscureText: false,
                          inputType: TextInputType.number,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 32, horizontal: 24),
                          child: FullWidthButton(
                            title: "Continue",
                            titleStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            backgroundColor: AppColor.primaryColor,
                            onClick: () {
                              onContinueClick(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      }
    );
  }

  showErr(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Check In"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              )
            ],
          );
        });
  }
}
