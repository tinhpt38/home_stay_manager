import 'package:flutter/material.dart';
import 'package:home_stay_project/ui/modular/authentication/widgets/select_button_widget.dart';


class GroupSelectButton extends StatefulWidget {
  final List<String> titles;
  final Function(String) onSelected;
  List<bool> states = List();

  GroupSelectButton({this.titles, this.onSelected});

  _GroupSelectButtonState createState(){
    //  for(int i = 0;i< titles.length;i++){
    //    states.add(false);
    //  }
    return _GroupSelectButtonState();
  }
}

class _GroupSelectButtonState extends State<GroupSelectButton> {

  void checkState(int index){
      setState(() {
      for(int i =0;i<widget.states.length;i++){
        widget.states[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      for(int i = 0;i< widget.titles.length;i++){
       widget.states.add(false);
     }
    return Container(
      width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: widget.titles.asMap().map((index, val) => MapEntry(index, Container(
           child: SelectButton(
             title: val,
             onSelected: (title){
               widget.onSelected(title);
                checkState(index);
             },
             isSelected: widget.states[index],
           ),
         ))).values.toList(),
       ),
    );
  }
}