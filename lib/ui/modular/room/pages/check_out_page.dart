import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/app_text_input_widget.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/check_out_page_model.dart';
import 'package:home_stay_project/ui/modular/room/room_route.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  final dynamic data;

  CheckOutPage({this.data});

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

  autoFillData(CheckOutPageModel model) {
    _fullNameCotller.text = model.detail.customer.name;
    _idColler.text = model.detail.customer.id;
    _dateStayColler.text = model.detail.customer.inAt;
    _dateLeaveColler.text = model.detail.customer.outAt;
    _roomColler.text = model.room.title;
    _numberOfStayColler.text = model.detail.numberPeople.toString();
    _priceColler.text = model.detail.prices[0].price.toString();
    _phoneColler.text = model.detail.customer.phone;
  }

  onContinueClick(CheckOutPageModel model, BuildContext context) {
    addPriceMore(model, context);
    RoomRoute.openPaymentPage(context, model.detail,model.getIndexRoom());
  }

  

  addPriceMore(CheckOutPageModel model, BuildContext context) {

    List<Price> prices = List();
    prices.add(model.detail.prices[0]);
    if (_drinkColler.text != "") {
      Price price = createPrice(_drinkColler, "Drink", context);
      if (price != null) {
        prices.add(price);
      }
    }
    if (_foodsColler.text != "") {
      Price price = createPrice(_foodsColler, "Foods", context);
      if (price != null) {
        prices.add(price);
      }
    }
    if (_motobikeColler.text != "") {
      Price price = createPrice(_motobikeColler, "Motobike", context);
      if (price != null) {
        prices.add(price);
      }
    }
    if (_infringeColler.text != "") {
      Price price = createPrice(_infringeColler, "Infrigne", context);
      if (price != null) {
        prices.add(price);
      }
    }
    model.detail.prices = prices;
    model.updateDetail();
  }

  createPrice(
      TextEditingController controller, String title, BuildContext context) {
    try {
      double price = double.parse(controller.text);
      return Price(title: title, price: price);
    } on Exception catch (e) {
      showErr(context, "Định dạng nhập vào không chính xác!");
    }
  }

  showErr(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Check Out"),
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

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CheckOutPageModel>(
        model: CheckOutPageModel(data: data, service: Provider.of(context)),
        builder: (context, model, child) {
          autoFillData(model);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Check Out".toUpperCase(),
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
                            "Create an Check Out",
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Fill in infomation customer when check in, please!",
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 18),
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
                          AppInputWidget(
                            cotller: _fullNameCotller,
                            label: "Full Name",
                            hinText: "Join Doe",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _idColler,
                            label: "ID",
                            hinText: "235945784",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _phoneColler,
                            label: "Phone Number",
                            hinText: "0352974899",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _dateStayColler,
                            label: "Date Stay",
                            hinText: "29/10/2019",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _dateLeaveColler,
                            label: "Date Leave",
                            hinText: "30/10/2019",
                            obscureText: false,
                          ),
                          AppInputWidget(
                            cotller: _roomColler,
                            label: "Room",
                            hinText: "Room 1",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _numberOfStayColler,
                            label: "Number of Stay",
                            hinText: "4",
                            obscureText: false,
                            isEnable: false,
                          ),
                          AppInputWidget(
                            cotller: _priceColler,
                            label: "Price",
                            hinText: "3.000.000.VND",
                            obscureText: false,
                          ),
                          AppInputWidget(
                            cotller: _foodsColler,
                            label: "Foods",
                            hinText: "100.000.VND",
                            obscureText: false,
                          ),
                          AppInputWidget(
                            cotller: _drinkColler,
                            label: "Drink",
                            hinText: "90.000.VND",
                            obscureText: false,
                          ),
                          AppInputWidget(
                            cotller: _motobikeColler,
                            label: "Motobike",
                            hinText: "300.000.VND",
                            obscureText: false,
                          ),
                          AppInputWidget(
                            cotller: _infringeColler,
                            label: "Infringe",
                            hinText: "30.000.VND",
                            obscureText: false,
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
                                onContinueClick(model, context);
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
          );
        });
  }
}
