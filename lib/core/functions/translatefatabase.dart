import 'package:bazar/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnar, columnen , columnru) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  }

  if(myServices.sharedPreferences.getString("lang") == "en"){
    return columnen;
  }

  if(myServices.sharedPreferences.getString("lang") == "ru"){
    return columnru;
  }
}
