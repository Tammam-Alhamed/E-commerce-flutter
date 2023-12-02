

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/color.dart';
import '../../../core/localization/changelocal.dart';

class Term_and_Conditions extends GetView<LocaleController> {
  const  Term_and_Conditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:600,
      decoration: BoxDecoration(
        color: AppColor.backgroundcolor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
      ),

      padding: EdgeInsets.only(top: 10,left: 10,right: 15),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text("123".tr)
        ),

    );

  }
}