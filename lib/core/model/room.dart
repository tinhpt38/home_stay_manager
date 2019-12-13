// part 'room.g.dart';

import 'package:home_stay_project/core/model/customer.dart';

class Room {
  String title;
  List<Detail> details;
  RoomState state;

  Room({this.title, this.details, this.state});

}


class Detail{
  Customer customer;
  int numberPeople;
  List<Price> prices;
  Detail({this.customer, this.numberPeople, this.prices});
}

class Price{
  String title;
  double price;

  Price({this.title, this.price});
}

enum RoomState{
  busy, clean, watting
}