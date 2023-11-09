import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/notification.dart';
import 'package:ecommercecourse/view/screen/settings.dart';
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
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationView() ,

     Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child:
        Lottie.asset(AppImageAsset.soon, width: 250, height: 250),)],
      ),

   Settings(),
  ];

  List bottomappbar = [
    {"title": "home", "icon": FontAwesome.house_user},
    {"title": "n", "icon": FontAwesome.bell},
    {"title": "profile", "icon": FontAwesome.arrow_trend_up},
    {"title": "settings", "icon":  EvaIcons.person}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
