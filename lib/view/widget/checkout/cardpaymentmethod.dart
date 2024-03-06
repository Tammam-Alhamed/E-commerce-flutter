import 'package:bazar/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CardPaymentMethodCheckout extends StatelessWidget {

  const CardPaymentMethodCheckout(
      {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text("76".tr,
          style: TextStyle(
              color:  AppColor.secondColor,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}

// final String title;
// final bool isActive;
// return Container(
// margin: const EdgeInsets.symmetric(horizontal: 10),
// padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// decoration: BoxDecoration(
// color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
// borderRadius: BorderRadius.circular(20)),
// child: Text(title,
// style: TextStyle(
// color: isActive == true ? Colors.blueGrey : AppColor.secondColor,
// height: 1,
// fontWeight: FontWeight.bold)),
// );