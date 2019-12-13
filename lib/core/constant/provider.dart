
import 'package:home_stay_project/core/service/service.dart';
import 'package:provider/provider.dart';
import '../service/api.dart';
List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, Service>(
    builder: (context, api, service){
      return Service();
    },
  ),
];


List<SingleChildCloneableWidget> uiConsumableProviders = [];
