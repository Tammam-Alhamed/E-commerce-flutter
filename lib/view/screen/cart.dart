// ignore_for_file: prefer_const_constructors
import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/widget/cart/customitemscartlist.dart';
import 'package:ecommercecourse/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    ProductDetailsControllerImp proudactController = Get.put(ProductDetailsControllerImp());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("42".tr),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${translateDatabase(cartController.priceorders, cartController.priceorders_d, cartController.priceorders_d)}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${translateDatabase(controller.getTotalPrice(), controller.getTotalPrice_d() ,controller.getTotalPrice_d())}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "${"43".tr} ${cartController.totalcountitems} ${"44".tr}"),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                              delete:() async {
                                await cartController
                                    .delete(cartController.data[index].itemsId! );
                                cartController.refreshPage();
                              },
                                onAdd: () async {
                                  await cartController
                                      .addfromcart(cartController.data[index].cartId! , cartController.data[index].itemsId! );
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.deletefromcart(
                                      cartController.data[index].cartId! ,cartController.data[index].itemsId!  );
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name:translateDatabase(
                                    cartController.data[index].itemsNameAr, cartController.data[index].itemsName ,cartController.data[index].itemsNameRu),
                                price:
                                    "${translateDatabase(cartController.data[index].itemsprice, cartController.data[index].itemsprice_d , cartController.data[index].itemsprice_d)}  ${"59".tr}",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
