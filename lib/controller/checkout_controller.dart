import 'dart:ui';

import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/address_data.dart';
import 'package:bazar/data/datasource/remote/checkout_date.dart';
import 'package:bazar/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod = "0";
  String? deliveryType;
  String addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;
  late String priceorders_d;
  late int points;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        print(dataaddress.length);
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("90".tr, "104".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("90".tr, "105".tr);
    }
    if (addressid == "0") {
      return Get.snackbar("90".tr, "105".tr);
    }
    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid,
      "orderstype": deliveryType.toString(),
      "pricedelivery": "0",
      "ordersprice": priceorders,
      "ordersprice_d": priceorders_d,
      "couponid": couponid,
      "coupondiscount" : coupondiscount.toString() ,
      "points" : points.toString() ,
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.delete<CartController>(force: true);
        Get.snackbar("32".tr, "106".tr,
          colorText: AppColor.backgroundcolor,
          backgroundColor: AppColor.fourthColor,);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("90".tr, "96".tr,
          colorText: AppColor.backgroundcolor,
          backgroundColor: AppColor.fourthColor,);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    priceorders_d = Get.arguments['priceorder_d'];
    points = Get.arguments['points'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
