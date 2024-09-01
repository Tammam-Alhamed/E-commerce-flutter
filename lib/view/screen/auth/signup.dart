import 'package:bazar/controller/auth/signup_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart'; 
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/alertexitapp.dart';
import 'package:bazar/core/functions/validinput.dart';
import 'package:bazar/view/widget/auth/custombuttonauth.dart';
import 'package:bazar/view/widget/auth/customtextbodyauth.dart';
import 'package:bazar/view/widget/auth/customtextformauth.dart';
import 'package:bazar/view/widget/auth/customtexttitleauth.dart';
import 'package:bazar/view/widget/auth/textsignup.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
                 HandlingDataRequest(statusRequest: controller.statusRequest,widget:  Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "10".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "24".tr),
                            const SizedBox(height: 15),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 20, "username");
                              },
                              mycontroller: controller.username,
                              hinttext: "23".tr,
                              iconData: Icons.person_outline,
                              labeltext: "20".tr,
                              // mycontroller: ,
                            ),
                            // CustomTextFormAuth(
                            //   isNumber: false,
                            //
                            //   valid: (val) {
                            //     return validInput(val!, 3, 40, "email");
                            //   },
                            //   mycontroller: controller.email,
                            //   hinttext: "12".tr,
                            //   iconData: Icons.email_outlined,
                            //   labeltext: "18".tr,
                            //   // mycontroller: ,
                            // ),


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
                                    mycontroller: controller.phone,
                                    hinttext: "22".tr,
                                    iconData: Icons.phone_android_outlined,
                                    labeltext: "21".tr,
                                    // mycontroller: ,
                                   ),
                                 ],
                               ),

                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 3, 30, "password");
                              },
                              mycontroller: controller.password,
                              hinttext: "13".tr,
                              iconData: Icons.remove_red_eye_outlined,
                              labeltext: "19".tr,
                            ),
                            CustomButtomAuth(
                                text: "17".tr,
                                onPressed: () {
                                  controller.signUp();
                                }),
                            const SizedBox(height: 40),
                            CustomTextSignUpOrSignIn(
                              textone: "25".tr,
                              texttwo: "26".tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ]),
                        ),
                      )),
          )),
    );
  }
}
