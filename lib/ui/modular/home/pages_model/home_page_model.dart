
import 'package:home_stay_project/core/model/homestay.dart';
import 'package:home_stay_project/core/service/service.dart';
import 'package:home_stay_project/ui/base/base_page_model.dart';

class HomePageModel extends BasePageModel{
  Homestay _homestay;
  Homestay get home => _homestay;

  HomePageModel(Service service){
    _homestay = service.homestay;
  }


}