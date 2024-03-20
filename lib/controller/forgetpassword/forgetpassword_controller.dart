import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail(); 
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  
  CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  
  StatusRequest statusRequest  = StatusRequest.none ;  

  late TextEditingController email;
  String? code ="+963";

  countryCode(number){
    code = number ;
    update();
  }
  @override
  checkemail() async  {
    if (formstate.currentState!.validate()){
       statusRequest = StatusRequest.loading; 
      update() ; 
      var response = await checkEmailData.postdata(email.text , code!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode , arguments: {
            "email" : email.text,
            "code" : code
          });
        } else {
          Get.defaultDialog(title: "90".tr , middleText: "94".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

 
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
