import 'package:bazar/controller/favorite_controller.dart';
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/view/widget/productdetails/color_productdetails.dart';
import 'package:bazar/view/widget/productdetails/priceandcount.dart';
import 'package:bazar/view/widget/productdetails/size_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../core/functions/translatefatabase.dart';
import '../widget/productdetails/slidedetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp =
        Get.put(ProductDetailsControllerImp(), permanent: true);
    FavoriteController controllerfav = Get.put(FavoriteController());
    MyServices myServices = Get.find();

    String formatAmount() {
      String price =
          "${translateDatabase(controllerImp.price, controllerImp.price, controllerImp.price)}";
      String priceInText = "";
      int counter = 0;
      for (int i = (price.length - 1); i >= 0; i--) {
        counter++;
        String str = price[i];
        if ((counter % 3) != 0 && i != 0) {
          priceInText = "$str$priceInText";
        } else if (i == 0) {
          priceInText = "$str$priceInText";
        } else {
          priceInText = ",$str$priceInText";
        }
      }
      return priceInText.trim();
    }

    return WillPopScope(
      onWillPop: () {
        return Future<bool>.value(
            Get.delete<ProductDetailsControllerImp>(force: true));
      },
      child: Scaffold(
          persistentFooterAlignment: AlignmentDirectional.bottomCenter,
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 50,
            child: Row(
              children: [
                MaterialButton(
                  minWidth: 270.0,
                  height: 50.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: AppColor.primaryColor,
                  onPressed: () {
                    // print(controllerImp.itemsModel.pricePoint);
                    controllerImp.addtocart(controllerImp.countitems.toString() , controllerImp.itemsModel.itemsPoint);
                    // Get.toNamed(AppRoute.cart);
                  },
                  child: Text(
                    "47".tr,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 19,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: Container(
                    height: 70,
                    width: 75,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) => ListView(children: [
                     Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: Sliderdetails(itemNum: controller.itemnum!,),
                              ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxHeight: double.infinity,
                                          ),
                                          padding: const EdgeInsets.all(10.0),
                                          width: 275,
                                          alignment: myServices
                                                      .sharedPreferences
                                                      .getString("lang") ==
                                                  'ar'
                                              ? Alignment.topRight
                                              : Alignment.topLeft,
                                          child: Text(
                                              translateDatabase(
                                                  controller
                                                      .itemsModel.itemsNameAr,
                                                  controller
                                                      .itemsModel.itemsName,
                                                  controller
                                                      .itemsModel.itemsNameRu),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    color: AppColor.fourthColor,
                                                  )),
                                        ),
                                        if (controllerfav.isFavorite[
                                                controllerImp
                                                    .itemsModel.itemsId] !=
                                            null)
                                          GetBuilder<FavoriteController>(
                                              builder: (controller) =>
                                                  IconButton(
                                                      onPressed: () {
                                                        if (controller.isFavorite[controllerImp.itemsModel.itemsId] == "1") {
                                                          controller.setFavorite(
                                                              controllerImp
                                                                  .itemsModel
                                                                  .itemsId,
                                                              "0");
                                                          controller
                                                              .removeFavorite(
                                                                  controllerImp
                                                                      .itemsModel
                                                                      .itemsId!);
                                                        } else {
                                                          controller.setFavorite(
                                                              controllerImp
                                                                  .itemsModel
                                                                  .itemsId,
                                                              "1");
                                                          controller.addFavorite(
                                                              controllerImp
                                                                  .itemsModel
                                                                  .itemsId!);
                                                        }
                                                      },
                                                      icon: Icon(
                                                        controller.isFavorite[
                                                                    controllerImp
                                                                        .itemsModel
                                                                        .itemsId] ==
                                                                "1"
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border_outlined,
                                                        color: AppColor
                                                            .primaryColor,
                                                      )))
                                      ],
                                    ),
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                              translateDatabase(
                                                  controller
                                                      .itemsModel.itemsDescAr,
                                                  controller
                                                      .itemsModel.itemsDesc,
                                                  controller
                                                      .itemsModel.itemsDescRu),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      height: 1,
                                                      color: AppColor.black)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          controllerImp.addPoint();
                                        },
                                          icon:   Icon(LineAwesome.plus_circle_solid , size: 28, color: AppColor.primaryColor,),),
                                        Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.only(bottom: 2),
                                            width: 50,
                                            height: 30,
                                            decoration:
                                            BoxDecoration(border: Border.all(color: AppColor.primaryColor), borderRadius: BorderRadius.circular(10),color: AppColor.backgroundcolor),
                                            child: Text(
                                              "${controllerImp.countpoint}",
                                              style: const TextStyle(fontSize: 18, height: 1.1 , color: AppColor.sky),
                                            )),
                                        IconButton(onPressed: (){
                                          controllerImp.removePoint();
                                        },
                                          icon: const Icon(LineAwesome.minus_circle_solid, size: 28, color: AppColor.primaryColor,),),
                                      ],
                                    ),
                                    PriceAndCountItems(
                                        onAdd: () {
                                          controller.add();
                                        },
                                        onRemove: () {
                                          controller.remove();
                                        },
                                        price: "${formatAmount()}",
                                        count: "${controller.countitems}"),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (controller.colors.length != 1 && controller.colors.length != 0)
                                              Column(
                                                children: [
                                                  const Text(" Select Color",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColor
                                                              .fourthColor)),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    height: 60,
                                                    child: CustomColor(),
                                                    width: 170,
                                                  ),
                                                ],
                                              ),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 0, right: 0)),
                                            if (controller.sizes.length != 1 && controller.sizes.length != 0)
                                              Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: AppColor
                                                              .primaryColor)),
                                                ),
                                                height: 60,
                                                child: Customsize(),
                                                width: 110,
                                              ),
                                          ]),
                                    ),
                                    SizedBox(height: 5),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ]),
                        )
                  ]))),
    );
  }
}
