import 'package:bazar/controller/auth/login_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/alertexitapp.dart';
import 'package:bazar/core/functions/validinput.dart';
import 'package:bazar/view/widget/auth/custombuttonauth.dart';
import 'package:bazar/view/widget/auth/customtextbodyauth.dart';
import 'package:bazar/view/widget/auth/customtextformauth.dart';
import 'package:bazar/view/widget/auth/customtexttitleauth.dart';
import 'package:bazar/view/widget/auth/logoauth.dart';
import 'package:bazar/view/widget/auth/textsignup.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('15'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(

            builder: (controller) => HandlingDataRequest(

                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(),
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "11".tr),
                      const SizedBox(height: 15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomTextFormAuth(
                            widget : CountryCodePicker(
                              hideSearch: false,
                              favorite: ['ru','sy'],
                              onChanged: (code) => controller.countryCode(code.dialCode),
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'sy',
                              showFlagDialog: true,
                            ),

                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 7, 11, "phone");
                            },
                            mycontroller: controller.email,
                            hinttext: "22".tr,
                            iconData: Icons.phone_android_outlined,
                            labeltext: "21".tr,
                            // mycontroller: ,
                          ),
                        ],
                      ),

                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },
                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.remove_red_eye_outlined,
                          labeltext: "19".tr,
                          // mycontroller: ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      CustomButtomAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 40),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
