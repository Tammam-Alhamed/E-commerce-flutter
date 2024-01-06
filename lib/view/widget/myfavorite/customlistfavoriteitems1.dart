import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/myfavoritecontroller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/numberstyle.dart';
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
        splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () {
          itemsModel1.itemsSold !="0" ? "" :controller.goToPageProductDetails(itemsModel1);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5),
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


                  const SizedBox(height:5),

                  Text(
                      translateDatabase(
                          itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                    textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.2,
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),

                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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