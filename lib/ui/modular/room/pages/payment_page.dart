import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/payment_page_model.dart';
import 'package:provider/provider.dart';

import '../room_route.dart';

class PaymentPage extends StatelessWidget {
  var data;
  PaymentPage({Key key, this.data});
  double total = 0;

  calTotal(PaymentPageModel model) {
    model.detail.prices.forEach((price) {
      total += price.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PaymentPageModel>(
      model: PaymentPageModel(data: data, service: Provider.of(context)),
      builder: (context, model, chil) {
        calTotal(model);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Payment".toUpperCase(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Full Name",
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          capitalize(model.detail.customer.name),
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Total".toUpperCase(),
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "$total VND",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 42,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              itemCount: model.detail.prices.length,
                              itemBuilder: (context, index){
                                return buildItem(
                                  title: model.detail.prices[index].title,
                                  price: model.detail.prices[index].price.toString()
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            child: buildItem(
                                title: "Total", price: "$total VND"),
                          ),
                        ],
                      )),
                ),
                Container(
                  child: FullWidthButton(
                    title: "PAY NOW",
                    titleStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    backgroundColor: AppColor.primaryColor,
                    onClick: () {
                      model.setIsCheckOut(true);
                      RoomRoute.openRatingPage(context);
                      
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

  Widget buildItem({String title, String price}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
          ),
          Text(
            "$price VND",
            style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

String capitalize(String string) {
  if (string == null) {
    throw ArgumentError("string: $string");
  }

  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}
