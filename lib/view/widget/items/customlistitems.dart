import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/model/itemscolorsmodel.dart';
import 'package:bazar/data/model/itemsimagesmodel.dart';
import 'package:bazar/data/model/itemssizesmodel.dart';
import 'package:bazar/view/Support/Images.dart';
import 'package:bazar/controller/favorite_controller.dart';
import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int itemnum ;
  // final bool active;
  const CustomListItems({super.key, required this.itemsModel , required this.itemnum});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String formatAmount() {
      String price =
          "${translateDatabase(itemsModel.itemsPrice, itemsModel.itemsPrice, itemsModel.itemsPrice)}";
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

    String formatAmount1() {
      String price =
          "${translateDatabase(itemsModel.itemspricedisount_d, itemsModel.itemspricedisount_d, itemsModel.itemspricedisount_d)}";
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

    // var f = NumberFormat.decimalPattern();

    controller.discount = itemsModel.itemsDiscount;

    return InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () {
          itemsModel.itemsSold != "0"
              ? ""
              : controller.goToPageProductDetails(itemsModel , itemnum);
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5),
          alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 7),
                                child: Images(
                                  url:
                                      "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                                  raduis: 7.0,
                                  height: 162,
                                  width: 162,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: myServices.sharedPreferences.getString("lang") == "en" ?Alignment.topLeft : myServices.sharedPreferences.getString("lang") == "ru" ?Alignment.topLeft : Alignment.topRight,
                              child: Text(
                                  translateDatabase(
                                      itemsModel.itemsNameAr,
                                      itemsModel.itemsName,
                                      itemsModel.itemsNameRu),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    height: 1,
                                    overflow: TextOverflow.fade,
                                    color: AppColor.black,
                                    fontSize: 15,
                                  )),
                            ),
                            if (itemsModel.itemsDiscount == "0")
                              const SizedBox(
                                height: 10,
                              ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (itemsModel.itemsSold != "0")
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Image.asset(
                                        translateDatabase(
                                            AppImageAsset.Sold_a,
                                            AppImageAsset.Sold,
                                            AppImageAsset.Sold_r),
                                        width: 60,
                                        height: 50,
                                      ),
                                    )

                                  else if (itemsModel.itemsDiscount != "0")
                                     Padding(
                                       padding: EdgeInsets.only(top: 10),
                                       child: Column(
                                          children: [
                                            Text("${formatAmount1()} ${"59".tr}",
                                                style: const TextStyle(
                                                    color: AppColor.primaryColor,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "sans",
                                                )),
                                            Text("${formatAmount()} ${"59".tr}",
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: AppColor.primaryColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: "sans"))
                                          ],
                                        ),
                                     )

                                  else
                                    Text(
                                          "${formatAmount()} ${"59".tr}",
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "sans")),

                                  GetBuilder<FavoriteController>(
                                      builder: (controller) => IconButton(
                                          onPressed: () {
                                            if (controller.isFavorite[
                                                    itemsModel.itemsId] ==
                                                "1") {
                                              controller.setFavorite(
                                                  itemsModel.itemsId, "0");
                                              controller.removeFavorite(
                                                  itemsModel.itemsId!);
                                            } else {
                                              controller.setFavorite(
                                                  itemsModel.itemsId, "1");
                                              controller.addFavorite(
                                                  itemsModel.itemsId!);
                                            }
                                          },
                                          icon: Icon(
                                            controller.isFavorite[
                                                        itemsModel.itemsId] ==
                                                    "1"
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: Colors.red,
                                          )))
                                ],
                              ),
                            ),
                          ]),
                    ),
                  if (itemsModel.itemsDiscount != "0")
                    Positioned(
                        top: 0,
                        left: 4,
                        child: Image.asset(
                          AppImageAsset.saleOne,
                          width: 40,
                        )),
                  if (itemsModel.itemsNew == "1")
                    Positioned(
                        top: -10,
                        right: 7,
                        child: Image.asset(
                          AppImageAsset.NEW,
                          width: 50,
                        ))
                ],
              ),
            ),);
  }
}
