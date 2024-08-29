import 'dart:async';

import 'package:bazar/controller/home_controller.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/home_data.dart';
import 'package:bazar/data/model/slidesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/categories_data.dart';
import '../data/model/categoriesmodel.dart';

abstract class SlidesController extends GetxController {
  intialData();
  goToPageProductDetails(CategoriesModel CategoriesModel);
  goToItems(List categories, int selectedCat, String categoryid);
}

class SlidesControllerImp extends SearchMixController {

  CategoriesData testData = CategoriesData(Get.find());
  List data = [];
  List<slidesmodel> image = [];

  List NEW = [] ;
  List offer = [] ;
  int limit = 30 ;
  var respon ;
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();




  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    getItems();
    getimage(limit);
  }

  goToItemsNew(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getNew();
    update();
  }


  goToItemsDiscount(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getItems();
    update();
  }

  goToItemsOffer(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getOffer();
    update();
  }

  getimage(int limit) async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData(myServices.sharedPreferences.getString("id")! , limit.toString());
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['slides']['data'];
        image.addAll(responsedata.map((e) => slidesmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getDiscount(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getNew() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getNew(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        respon = response['data'];
        data.addAll(response['data']);
        NEW.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getOffer() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getOffer(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
        offer.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageProductDetails(itemsModel , itemnum) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel": itemsModel,
      "respon" : respon ,
      "itemnum" : itemnum
    });
  }
}