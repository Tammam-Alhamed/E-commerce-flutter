import 'package:bazar/controller/orders/pending_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/numberstyle.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${"81".tr} : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parse(listdata.ordersDatetime!, pattern: "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(),
              Text(

                  "${"82".tr} : ${controller.printOrderType(listdata.ordersType!)}"),
              // Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),


              Text("${"83".tr} : ${formatAmount(listdata.ordersPrice_d , listdata.ordersPrice_d , listdata.ordersPrice_d)} ${"59".tr}"),
              // Text("Delivery Price : ${listdata.ordersPricedelivery}  ${"59".tr} "),
              Text(
                  "${"84".tr}: ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "${"85".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Flexible(
                    child: Text("${"52".tr} : ${formatAmount(listdata.ordersTotalprice_d , listdata.ordersTotalprice_d , listdata.ordersTotalprice_d)}  ${"59".tr}",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child:  Text("86".tr),
                  ),
                  SizedBox(width: 10),
                 if (listdata.ordersStatus! == "0") MaterialButton(
                    onPressed: () {
                      controller.deleteOrder(listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child:  Text("87".tr),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
