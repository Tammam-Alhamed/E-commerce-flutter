import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "111".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "112".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "113".tr ;
    }
  }

  if (val.isEmpty) {
    return "114".tr;
  }

  if (val.length < min) {
    return "${"115".tr} $min";
  }

  if (val.length > max) {
    return "${"116".tr} $max";
  }
}
