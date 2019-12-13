import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class CheckInPageModel extends BasePageModel{
  Service _service;

  Room _room;
  Room get room => _room;

  CheckInPageModel({Service service}): _service = service;


  getRoom(int index){
    _room= _service.getRoom(index-1);
    notifyListeners();
  }

  setDetail(Detail detail, int roomIndex){
    _service.setDetail(detail, roomIndex);
  }
}