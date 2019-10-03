import 'package:flutter/material.dart';

class BasePageModel extends ChangeNotifier{
  bool _busy;
  bool get busy => _busy;
  
  setBusyChange(bool value){
    _busy = value;
  }
}