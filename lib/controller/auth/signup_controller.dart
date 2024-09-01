import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/auth/signup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  String? code ="+963";
  late TextEditingController phone;
  late TextEditingController password;

   StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  SignupData signupData = SignupData(Get.find());

  List data = [];

  countryCode(number){
    code = number ;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await signupData.postdata(
          username.text, password.text,  phone.text , code!);
      print("=============================== Controller +! $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
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
          Get.offNamed(AppRoute.homepage  ,arguments: {
            "email" : phone.text ,
            "code" : code
          });
        } else {
          Get.defaultDialog(title: "90".tr , middleText: "92".tr) ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
