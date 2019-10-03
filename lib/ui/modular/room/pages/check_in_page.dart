import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<NullablePageModel>(
      model: NullablePageModel(),
      builder: (context, modle, child) => Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: (){
              
            },
            child: Icon(Icons.arrow_back,color: AppColor.primaryColor,),
          ),
        ),
        body: Container(
          
        ),
      ),
    );
  }
}