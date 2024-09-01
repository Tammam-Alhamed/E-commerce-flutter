import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(HomeScreenControllerImp()) ;
    Get.put(Crud()) ; 
  }
}
