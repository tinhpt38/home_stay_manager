import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class CheckOutPageModel extends BasePageModel {
  dynamic _data;
  Service _service;

  Detail _detail;
  Detail get detail => _detail;
  Room _room;
  Room get room => _room;

  CheckOutPageModel({dynamic data, Service service}) {
    _data = data;
    _service = service;
    _detail = _data["detail"];
    _room = _data["room"];
  }

  getIndexRoom(){
String temp = room.title.substring(4,room.title.length);
    int index = int.parse(temp) -1;
    return index;
  }
  
  updateDetail(){
    
    _service.updateDetail(detail, getIndexRoom());
  }


}
