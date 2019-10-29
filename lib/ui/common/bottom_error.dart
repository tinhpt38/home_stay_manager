import 'package:flutter/material.dart';

import 'app_colors.dart';

class BottomError {
    static void showError(BuildContext context, String message){
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return Container(
              height: size.height * (1/5),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Warring",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                 Expanded(
                   flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      color: Colors.red,
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                 )
                ],
              )
              );
      }
    );
  }
}