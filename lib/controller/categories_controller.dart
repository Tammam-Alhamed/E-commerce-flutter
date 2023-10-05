import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/categories_data.dart';
import '../data/model/categoriesmodel.dart';

abstract class CategoriesController extends GetxController {
  intialData();
  changeShope(int val, String shopeval);
  getcat(String shopeid);
  goToPageProductDetails(CategoriesModel CategoriesModel);
  goToItems(List categories, int selectedCat, String categoryid);
}

class CategoriesControllerImp extends SearchMixController {
  List shopes = [];
  String? shopeid;
  int? selectedShope;

  CategoriesData testData = CategoriesData(Get.find());
  HomeData homedata = HomeData(Get.find());
  List categories = [];
  List items = [];

  List data = [];


  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    getdata();
    super.onInit();
  }

  intialData() {
    shopes = Get.arguments['shopes'];
    selectedShope = Get.arguments['selectedShope'];
    shopeid = Get.arguments['shopeid'];
    getItems(shopeid!);
  }

  changeShope(val, shopeval) {
    selectedShope = val;
    shopeid = shopeval;
    getItems(shopeid!);
    update();
  }

  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getItems(shopeid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        shopeid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
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

  goToPageProductDetails(CategoriesModel) {
    Get.toNamed("categoriedetails", arguments: {"shopesModel": CategoriesModel});
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
