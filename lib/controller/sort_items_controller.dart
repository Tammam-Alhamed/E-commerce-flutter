import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/categories_data.dart';
import 'package:ecommercecourse/data/datasource/remote/sort_data.dart';
import 'package:ecommercecourse/data/datasource/remote/items_images.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SortItemsController extends GetxController {
  intialData();
  getimages(String imageid);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class SortItemsControllerImp extends SearchMixController {

  List categories = [];
  String? catid;
  String? imgid;
  String? shopeid;
  String? discount;

  int? selectedCat;
  SortData testData = SortData(Get.find());

  String? currentTabCat;


  List data = [];
  List image = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    imgid = Get.arguments['imgid'];
  }

  getA_to_Z(categoryid , lang) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getA_to_Z(
        categoryid, myServices.sharedPreferences.getString("id")! , lang);
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


  goToA_to_Z(lang) {
    Get.toNamed(AppRoute.items);
    getA_to_Z(catid , lang );
  }



}