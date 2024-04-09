import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? code ="+963";
  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
  countryCode(number){
    print(code);
    code = number ;
    update();
  }


  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text, code!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
         // myServices.sharedPreferences.clear() ;
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['users_approve'] == "1") {
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
          } else {
            Get.toNamed(AppRoute.homepage,
                arguments: {
              "email": email.text ,
              "code" : code
            });
          }
        } else {
          Get.defaultDialog(
              title: "90".tr, middleText: "91".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
