// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class InfoWidget extends StatefulWidget {
  
  final String name;
  final String profile;
  final String avatar;

  InfoWidget({this.name, this.profile, this.avatar = "https://hmp.me/csh4"}):assert(name != null),assert(profile !=null);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {

  double _opacity = 0;
  Radius _radius = Radius.circular(0);
  double _padding = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _opacity = 1;
        _radius = Radius.circular(90);
        _padding = 12;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 3),
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            width: size.width * (1/4),
            height: size.width * (1/4),
            duration: Duration(seconds: 2),
            padding: EdgeInsets.all(_padding),
            decoration: BoxDecoration(
              color: AppColor.borderColor,
              borderRadius: BorderRadius.all(_radius),
            ),
            child: Image.network(widget.avatar),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.profile,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[400]
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}