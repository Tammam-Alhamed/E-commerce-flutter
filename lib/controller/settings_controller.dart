import 'dart:io';

import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  LocaleController controller = Get.put(LocaleController());

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.lang);
    myServices.sharedPreferences.clear();

    // exit(0);
  }
}
