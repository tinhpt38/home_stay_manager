import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/base/base_widget.dart';
import 'package:home_stay_project/ui/base/null_page_model.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';
import 'package:home_stay_project/ui/common/app_style.dart';
import 'package:home_stay_project/ui/common/full_width_button_widget.dart';

import '../room_route.dart';

class RatingPage extends StatefulWidget {
  RatingPage({Key key}) : super(key: key);

  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  double _values = 0;

  AssetImage _image = AssetImage("assets/happy.png");
  double _opacity = 1;

  List<AssetImage> _images = List();

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
    _images.add(AssetImage("assets/bad.png"));
    _images.add(AssetImage("assets/medium.png"));
    _images.add(AssetImage("assets/happiness.png"));
    _images.add(AssetImage("assets/happy.png"));
    _image = _images[_images.length -1];
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200)
    );

    _animation =
        Tween(begin: 10.0,end: 14.0).animate(_animationController);
    
     _animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat();
      }
    });
    
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
             Expanded(
               flex: 4,
                child: AnimatedBuilder(
                 animation: _animationController,
                 builder: (context, child){
                   return Transform.scale(
                     scale: _animation.value,
                      child: Container(
                       child: ImageIcon(
                       _image,
                         size: _animation.value,
                         color: AppColor.primaryColor,
                       )
                     ),
                   );
                 }
                ),
             ),
              Expanded(
                flex: 3,
                child: Slider(
                  value: _values,
                  min: 0,
                  max: 100,
                  onChanged: (value){
                  _animationController.forward();
                  onSliderChange(value);
                  },
                  activeColor: AppColor.primaryColor,
                  inactiveColor: AppColor.primaryColor,
                ),
              ),
              Container(
                child: FullWidthButton(
                  title: "Done".toUpperCase(),
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  backgroundColor: AppColor.primaryColor,
                  onClick: (){

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