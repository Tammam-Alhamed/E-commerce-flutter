import 'package:bazar/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/validinput.dart';
import 'package:bazar/view/widget/auth/custombuttonauth.dart';
import 'package:bazar/view/widget/auth/customtextbodyauth.dart';
import 'package:bazar/view/widget/auth/customtextformauth.dart';
import 'package:bazar/view/widget/auth/customtexttitleauth.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('14'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) =>  
          HandlingDataRequest( statusRequest: controller.statusRequest, widget: 
           Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "27".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          // please Enter Your Email Address To Recive A verification code
                          text: "29".tr),
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
                      CustomButtomAuth(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkemail();
                          }),
                      const SizedBox(height: 40),
                    ]),
                  ),
                ))),
    );
  }
}
