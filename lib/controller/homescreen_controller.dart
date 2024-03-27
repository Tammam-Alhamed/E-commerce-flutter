import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/main.dart';
import 'package:bazar/view/screen/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/screen/notification.dart';
import 'package:bazar/view/screen/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/imgaeasset.dart';
import '../linkapi.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  int currentpage = 0;

  List listPage = [
    const HomePage(),
    NotificationView() ,

    Spacer(),
     Cart(),

   Settings(),
  ];

  unreadNotifaction() async{
    myServices.sharedPreferences.remove('unreadCount');
    int unreadCount;
     unreadCount = myServices.sharedPreferences.getInt('unreadCount') ?? 0;

    // Increment the unread count
    unreadCount++;
    // Save the updated count
    await myServices.sharedPreferences.setInt('unreadCount', unreadCount);
    myServices.sharedPreferences.reload();
    update();
  }

  void onInit() {
    myServices.sharedPreferences.reload();
    myServices.sharedPreferences.getInt('unreadCount');
    super.onInit();
  }


  @override
  changePage(int i) {
    myServices.sharedPreferences.reload();
    currentpage = i;
    update();
  }
}
