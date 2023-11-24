import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
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

  List NEW = [] ;

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
  }

  goToItemsNew(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getNew();
  }


  goToItemsDiscount(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getItems();
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
        data.addAll(response['data']);
        NEW.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}