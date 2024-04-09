import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/controller/myfavoritecontroller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/functions/numberstyle.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/data/model/myfavorite.dart';
import 'package:bazar/linkapi.dart';
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
        splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () {
          itemsModel1.itemsSold !="0" ? "" :controller.goToPageProductDetails(itemsModel1);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                       CachedNetworkImage(
                        imageUrl:
                            AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                        height: 180,
                        width: 180,
                        placeholder: (BuildContext context, String url) => Container(
                          width: 320,
                          height: 240,
                          decoration: BoxDecoration(
                              color: AppColor.backgroundcolor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child:  Image.asset(AppImageAsset.logo ,width: 100,)),
                        ),
                        fadeInDuration: const Duration(milliseconds: 500),
                        fit: BoxFit.cover,
                      ),


                  const SizedBox(height:5),

                  Text(
                      translateDatabase(
                          itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                    textAlign: TextAlign.start,
                      style: const TextStyle(
                        height: 1.2,
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),

                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(itemsModel1.itemsSold != "0")
                          Image.asset( translateDatabase(
                              AppImageAsset.Sold_a, AppImageAsset.Sold ,AppImageAsset.Sold_r),width:50,height: 55,)
                        else
                          if(itemsModel1.itemsSold == "0")
                        Text("${formatAmount(
                            itemsModel1.itemspricedisount_d,   itemsModel1.itemspricedisount_d ,  itemsModel1.itemspricedisount_d)}  ${"59".tr}",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize:13,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                        IconButton(
                            onPressed: () {
                                controller.deleteFromFavorite(itemsModel.favoriteId!) ;
                            },
                            icon: const Icon(
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