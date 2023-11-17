import 'package:get/get.dart';
import 'package:weatherapp/controller/HomeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(city: "cairo"));
  }
}
