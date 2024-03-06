import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/categories_data.dart';

abstract class CategoriesController extends GetxController {

}

class CategoriesControllerImp extends SearchMixController {
  List shopes = [];
  String? shopeid;

  int? selectedShope;
  int i = 1;

  CategoriesData testData = CategoriesData(Get.find());

  List categories = [];
  List data = [];


  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    shopeid = Get.arguments['shopeid'];
    getItems(shopeid!);
  }


  changeShopee( shopeval) {
    shopeid = shopeval;
    getItems(shopeid!);
    update();
  }



  goToItems(categories, selectedCat, categoryid ) {
    Get.toNamed(
        AppRoute.items,
        arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid,
    });
  }

  getItems(shopeid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        shopeid, myServices.sharedPreferences.getString("id")!);
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
