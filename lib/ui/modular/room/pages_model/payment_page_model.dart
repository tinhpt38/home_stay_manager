import 'package:home_stay_project/core/model/room.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class PaymentPageModel extends BasePageModel {
  Detail _detail;
  Service _service;
  int _roomIndex;
  var _data;
  Detail get detail => _detail;

  PaymentPageModel({var data, Service service}) {
    _data = data;
    _detail = data["detail"];
    _roomIndex = data["indexRoom"];
    _service = service;
  }

  setIsCheckOut(bool value) {
    _service.detailCheckOut(_detail, value, _roomIndex);
  }
}
