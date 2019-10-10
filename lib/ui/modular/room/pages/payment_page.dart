import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';
import 'package:home_stay_project/ui/modular/room/pages_model/payment_page_model.dart';

import '../room_route.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PaymentPageModel>(
      model: PaymentPageModel(),
      builder: (context, model, chil){
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
            onPressed: (){
              RoomRoute.goBack(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.primaryColor,),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Full Name",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Text(
                        "Phan Trung Tinh",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),
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
                        color: AppColor.primaryColor,
                        fontSize: 20
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.all(12),
                       child: Text(
                        "3.790.000 VND",
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
                  child: ListView(
                    children: <Widget>[
                     buildItem(
                       title: "Room",
                       price: "3.000.000 VND"
                     ),
                      buildItem(
                       title: "Foods",
                       price: "100.000 VND"
                     ),
                     buildItem(
                       title: "Drink",
                       price: "90.000 VND"
                     ),
                     buildItem(
                       title: "Motobike",
                       price: "300.000 VND"
                     ),
                     buildItem(
                       title: "Infringe",
                       price: "300.000 VND"
                     ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                child: buildItem(
                  title: "Total",
                  price: "3.790.000 VND"
                ),
              ),
                    ],
                  ),
                ),
              ),
              Container(
                child: FullWidthButton(
                  title: "PAY NOW",
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  backgroundColor: AppColor.primaryColor,
                  onClick: (){
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

  Widget buildItem({String title, String price}){
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16
                      ),
                    ),
                  Text(
                    price,
                    style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 16
                    ),
                  ),
                          ],
                        ),
    );
  }
}