import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';

import '../room_route.dart';

class RatingPage extends StatefulWidget {
  RatingPage({Key key}) : super(key: key);

  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {

  double _values = 0;

  Image _image;

  List<Image> _images = List();

  onSliderChange(double value){
   setState(() {
     if(value<25){
       _image = _images[0];
     }else if(value>=25 && value <50 ){
      _image = _images[1];
     }else if(value >= 50 && value < 75){
      _image = _images[2];
     }else{
       _image = _images[3];
     }
    _values = value;
   });
  }


  @override
  void initState() {
    _images.add(Image.asset("assets/bad.png"));
    _images.add(Image.asset("assets/medium.png"));
    _images.add(Image.asset("assets/happiness.png"));
    _images.add(Image.asset("assets/happy.png"));
    _image = _images[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget<NullablePageModel>(
      model: NullablePageModel(),
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Rating".toUpperCase(),
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
          child: Column(
            children: <Widget>[
             SizedBox(
               width: size.width * (1/3),
               height: size.width * (1/3),
               child:  AnimatedContainer(
                duration: Duration(seconds: 3),
                child: _image,
              ),
             ),
              Slider(
                value: _values,
                min: 0,
                max: 100,
                onChanged: onSliderChange,
                activeColor: AppColor.primaryColor,
                inactiveColor: AppColor.primaryColor,
              ),
            ],
          ),
        ),
        );
      },
    );
  }
}