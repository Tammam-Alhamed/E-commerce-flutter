import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/cart_data.dart';

import 'package:bazar/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

   late ItemsModel itemsModel;


  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
   String? sid ;
  MyServices myServices = Get.find();

  int countitems = 0;
  int currentTabColor = 0;
  String? currentTabSize ;
  List respon = [];
  List colors =[];
  List sizes =[];
  int? itemnum ;
  List data = [];

  intialData() async {
    statusRequest =  StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    respon = Get.arguments['respon'];
    itemnum = Get.arguments['itemnum'];
    // countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    data.addAll(respon);
    sizes.addAll(data[itemnum!]['size']);
    colors.addAll(data[itemnum!]['color']);
    update();
  }

  getCountItems(String itemsid) async {
    colors.clear();
    sizes.clear();
    // images.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data']);
        print("==================================");
        print("$countitems");
        colors.addAll(response['colors']['data']);
        sizes.addAll(response['sizes']['data']);
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  addItems(String itemsid , String itemsqua , String itemscolor , String itemssize) async {

    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid , itemsqua , itemscolor , itemssize );
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "99".tr,
            messageText:  Text("100".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "99".tr,
            messageText:  Text("103".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

   // addcolor(String itemsid , String color) async {
   //   statusRequest = StatusRequest.loading;
   //   update();
   //   var response = await cartData.addColor(
   //       myServices.sharedPreferences.getString("id")!, itemsid , color);
   //   print("=============================== Controller $response ");
   //   statusRequest = handlingData(response);
   //   if (StatusRequest.success == statusRequest) {
   //     // Start backend
   //     if (response['status'] == "success") {
   //       // data.addAll(response['data']);
   //     } else {
   //       statusRequest = StatusRequest.failure;
   //     }
   //     // End
   //   }
   //   update();
   // }

   String? colr ;
   color( col) {
    colr = col;
     currentTabColor;
     update();
   }


   siezs() {

     currentTabSize;
     update();
   }

   addtocart( countitems){
     if(sizes.length == 1){currentTabSize = "0";}
     if(colors.length == 1){colr = "0";}
     if (countitems == "0") {
       return Get.snackbar("90".tr, "119".tr ,colorText: Colors.white ,backgroundColor: Colors.grey);
     }
     if (colr == null) {
       return Get.snackbar("90".tr, "120".tr,colorText: Colors.white ,backgroundColor: Colors.grey);
     }
     if (currentTabSize == null) {
       return Get.snackbar("90".tr, "121".tr,colorText: Colors.white ,backgroundColor: Colors.grey);
     }

     addItems(itemsModel.itemsId! , countitems , colr! , currentTabSize! );
     update();
   }

   add() {
    // addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      // deleteitems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }



}
