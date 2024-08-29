import 'package:bazar/controller/home_controller.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/myfavorite_data.dart';
import 'package:bazar/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

abstract class MyFavoriteController extends GetxController {
  goToPageProductDetails(MyFavoriteModel itemsModel);
}

class MyFavoriteControllerImp extends SearchMixController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];
  List<ItemsModel> dataitem = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

//  key => id items
//  Value => 1 OR 0

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        respon = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        dataitem.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        // print("data");
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  goToPageProductDetails(itemsModel1 , itemnum) {
    Get.toNamed("productdetails", arguments: {
      "itemsmodel": itemsModel1,
      "respon" : respon ,
      "itemnum" : itemnum
    });
  }
}
