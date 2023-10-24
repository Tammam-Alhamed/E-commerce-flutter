import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/productdetails/priceandcount.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatefatabase.dart';
import '../widget/productdetails/slidedetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
        
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child:  Text(
                  "47".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
              Sliderdetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                        child: Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(translateDatabase(
                                    controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName ,controller.itemsModel.itemsNameRu),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          color: AppColor.fourthColor,
                                        )),
                                SizedBox(height: 10),

                                Text( translateDatabase(
                                    controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc ,controller.itemsModel.itemsDescRu),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.grey2)),
                                const SizedBox(height: 10),


                                PriceAndCountItems(
                                    onAdd: () {
                                      controller.add();
                                    },
                                    onRemove: () {
                                      controller.remove();
                                    },
                                    price:
                                        "${controller.itemsModel.itemsPriceDiscount}",
                                    count: "${controller.countitems}"),
                                const SizedBox(height: 10),

                                // Text("Color",
                                //     style: Theme.of(context).textTheme.headline1!.copyWith(
                                //           color: AppColor.fourthColor,
                                //         )),
                                // const SizedBox(height: 10),
                                // const SubitemsList()
                              ]),
                        ),
                      ))
                ])));
  }
}
