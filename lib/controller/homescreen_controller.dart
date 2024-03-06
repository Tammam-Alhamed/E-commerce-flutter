import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/view/screen/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/screen/notification.dart';
import 'package:bazar/view/screen/settings.dart';
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
  int count_notification = 0;


  List listPage = [
    const HomePage(),
    NotificationView() ,

    Spacer(),
     Cart(),

   Settings(),
  ];


  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
