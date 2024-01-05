import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/myfavoritecontroller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/myfavorite.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteControllerImp> {
  final MyFavoriteModel itemsModel;
  final ItemsModel itemsModel1;

  // final bool active;
   CustomListFavoriteItems( {Key? key,required this.itemsModel1, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: Colors.white,
        onTap: () {
          print(itemsModel1.itemsPrice);
          itemsModel1.itemsSold !="0" ? "" :controller.goToPageProductDetails(itemsModel1);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                       CachedNetworkImage(
                        imageUrl:
                            AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                        height: 100,
                        placeholder: (BuildContext context, String url) => Container(
                          width: 320,
                          height: 240,
                          decoration: BoxDecoration(
                              color: AppColor.backgroundcolor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child:  Image.asset(AppImageAsset.logo ,width: 100,)),
                        ),
                        fadeInDuration: const Duration(milliseconds: 500),
                        fit: BoxFit.fill,
                      ),


                  const SizedBox(height: 10),
                  Text(
                      translateDatabase(
                          itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rating", textAlign: TextAlign.center),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 22,
                          child: Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 15,
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if(itemsModel1.itemsSold != "0")
                          Image.asset(AppImageAsset.Sold , width: 75,height: 80,)
                        else
                          if(itemsModel1.itemsSold == "0")
                        Text("${translateDatabase(
                            itemsModel.itemsPrice, itemsModel.itemsPriceD ,itemsModel.itemsPriceD)}  ${"59".tr}",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                        IconButton(
                            onPressed: () {
                                controller.deleteFromFavorite(itemsModel.favoriteId!) ;
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: AppColor.primaryColor,
                            ))
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))