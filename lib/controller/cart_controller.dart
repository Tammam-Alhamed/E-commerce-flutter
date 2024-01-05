import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:ecommercecourse/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'productdetails_controller.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());
  ProductDetailsControllerImp controller = ProductDetailsControllerImp();

  int? discountcoupon = 0;

  String? couponname;

  String? couponid;

  late StatusRequest statusRequest;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

 int priceorders = 0;
 int priceorders_d = 0;

  int totalcountitems = 0;

  add(String itemsid ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid , controller.countitems as String , controller.currentTabColor as String , controller.currentTabSize!);
    print("=============================== Controller $response ");
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


  addfromcart(String cartid , String itemsid ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addFromCart(
        myServices.sharedPreferences.getString("id")!, cartid   , itemsid);
    print("=============================== Controller $response ");
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

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("101".tr, "102".tr);
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString() , 
      "priceorder_d": priceorders_d.toString() ,
      "discountcoupon" : discountcoupon.toString()
    });
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  getTotalPrice_d() {
    return (priceorders_d - priceorders_d * discountcoupon! / 100);
  }

  delete(String itemsid) async {
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
            title: "101".tr,
            messageText: Text("103".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deletefromcart(String cartid , String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteFromCart(
        myServices.sharedPreferences.getString("id")!, cartid , itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "101".tr,
            messageText: Text("103".tr));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("90".tr, "98".tr) ;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    priceorders_d = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice['totalcount']);
          priceorders = int.parse(dataresponsecountprice['totalprice']);
          priceorders_d = int.parse(dataresponsecountprice['totalprice_d']);
          print(priceorders);
          print(priceorders_d);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
