import 'dart:io';

import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/localization/changelocal.dart';
import 'package:bazar/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  LocaleController controller = Get.put(LocaleController());

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    if(!kIsWeb) {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    }
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.lang);
    myServices.sharedPreferences.clear();

    // exit(0);
  }
}
