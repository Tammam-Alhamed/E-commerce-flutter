// ignore_for_file: prefer_const_constructors

import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/view/widget/cart/buttoncart.dart';
import 'package:bazar/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
          GetBuilder<CartController>(
              builder: (controller) =>
              controller.couponname == null ?
               Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: controllercoupon,
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              hintText: "48".tr,
                              border: OutlineInputBorder()),
                        )),
                    SizedBox(width: 5),
                    Expanded(
                        flex: 1,
                        child: CustomButtonCoupon(
                          textbutton: "49".tr,
                          onPressed: onApplyCoupon,
                        ))
                  ]))
                  : Container(
                      child: Text("${"48".tr} ${controller.couponname!}",
                      style: TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
                  ))
                  ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("50".tr, style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price  ${"59".tr}", style: TextStyle(fontSize: 16)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("51".tr, style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount ", style: TextStyle(fontSize: 16)))
                ],
              ),

              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("52".tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice  ${"59".tr}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor)))
                ],
              ),
            ]),
          ),
          SizedBox(height: 20),
          CustomButtonCart(
            textbutton: "53".tr,
            onPressed: () {
              controller.goToPageCheckout() ;
            },
          )
      ],
    ),
        ));
  }
}
