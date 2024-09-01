import 'dart:io';
import 'dart:ui';

import 'package:bazar/core/constant/apptheme.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/localization/changelocal.dart';
import 'package:bazar/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
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

    changeLang(String langcode) {
      Locale locale = Locale(langcode);
      myServices.sharedPreferences.setString("lang", langcode);
      appTheme = langcode == "ar" ? themeArabic : ( langcode == "en" ? themeRussia :themeEnglish);
      Get.changeTheme(appTheme);
      Get.updateLocale(locale);
    }

}
