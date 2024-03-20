import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());
 

  String? email;
  String? code;

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none ;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp , code!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response);
          myServices.sharedPreferences
              .setString("id", response['data']['id']);
          var userid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("username", response['data']['name']);
          // myServices.sharedPreferences
          //     .setString("email", response['data']['email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['phone']);
          myServices.sharedPreferences.setString("step", "2");
          if(!kIsWeb) {
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          }
          Get.offNamed(AppRoute.homepage);

        // Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "90".tr,
            middleText: "93".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    super.onInit();
   }

   reSend(){
      verfiyCodeSignUpData.resendData(email!); 
   }
 
}
