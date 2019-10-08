import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class InfoWidget extends StatefulWidget {
  
  final String name;
  final String profile;

  InfoWidget({this.name, this.profile}):assert(name != null),assert(profile !=null);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() => _opacity = 1);
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 3),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColor.borderColor,
              shape: BoxShape.circle
            ),
            child: Icon(
              Icons.people,
              color: AppColor.primaryColor,
              size: 48,
            ),
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
                color: AppColor.borderColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}