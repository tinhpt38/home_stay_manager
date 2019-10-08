import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/common/app_colors.dart';

class HomeSquareButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  final EdgeInsets margin;
  HomeSquareButton({this.title, this.onClick, this.margin});

  @override
  _HomeSquareButtonState createState() => _HomeSquareButtonState();
}

class _HomeSquareButtonState extends State<HomeSquareButton> {

  Alignment _alignment = Alignment.centerLeft;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _alignment = Alignment.center;
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTap: widget.onClick,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: widget.margin,
            alignment: _alignment,
            color: AppColor.secondaryColor,
            child: AnimatedOpacity(
              opacity: _opacity,
                    duration: Duration(seconds: 3),
                    child: Text(
                      widget.title.toUpperCase(),
                      style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}