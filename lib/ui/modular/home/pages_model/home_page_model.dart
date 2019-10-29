
import 'package:flutter/widgets.dart';
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class HomePageModel extends BasePageModel{
  Homestay _homestay;
  Homestay get home => _homestay;

  HomePageModel(@required Homestay homestay){
    _homestay = homestay == null ? Homestay(
      rooms: List.generate(6, (i){
        return Room(
          title: "Room $i",
          details: null,
          state: RoomState.clean
        );
      })
    ) : homestay;
    print("name : ${_homestay.name}");
  }


}