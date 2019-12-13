import 'package:flutter/material.dart';
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class ListRoomPageModel extends BasePageModel{
 Homestay _homestay;
 Homestay get home => _homestay;
 Service _service;

  ListRoomPageModel({Service service}){
     _service = service;
     _homestay = _service.homestay;
  }


}