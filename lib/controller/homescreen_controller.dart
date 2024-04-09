import 'package:bazar/core/services/services.dart';
import 'package:bazar/view/screen/cart.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/screen/notification.dart';
import 'package:bazar/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/class/statusrequest.dart';


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

  unreadNotifaction(unreadCount) async{

     unreadCount = myServices.sharedPreferences.getInt('unreadCount') ?? 0;
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
