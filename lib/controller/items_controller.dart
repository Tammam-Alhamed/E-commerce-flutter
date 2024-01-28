import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/categories_data.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/datasource/remote/items_images.dart';
import 'package:ecommercecourse/data/datasource/remote/sort_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  // changeCat(int val, String catval);
  getimages(String imageid);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {

  List categories = [];
  String? catid;
  String? imgid;
  String? shopeid;
  String? discount;

  int? selectedCat;
  ItemsData testData = ItemsData(Get.find());
  ItemsImages dataimage =ItemsImages(Get.find());
  SortData sort = SortData(Get.find());

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
    getItems(catid!);


  }

  // changeShopee( shopeval) {
  //   Get.back(result: 'hello');
  //   shopeid = shopeval;
  //   getShope(shopeid!);
  // }
  changeCat( catval) {
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
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


  getimages(String imageid) async {
    image.clear();
    statusRequest = StatusRequest.loading;
    var response = await dataimage.getData(
        imageid);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        image.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  getA_to_Z(categoryid , lang) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await sort.getA_to_Z(
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



  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}