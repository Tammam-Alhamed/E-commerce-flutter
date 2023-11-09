import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print("==============================");
          controller.goToPageProductDetails(itemsModel);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColor.fourthColor.withOpacity(0.4),
                  spreadRadius:2,
                  blurRadius: 20,
                  offset: Offset(0, 2),
                  blurStyle: BlurStyle.inner// changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.grey , width: 1.5),
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
          ),

          child: Stack(
            children: [
              Padding(
               padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                           Flexible(
                             flex: 3,
                             child: Container(
                               margin:EdgeInsets.only(bottom: 15 , top: 3),

                               child: CachedNetworkImage(
                                imageUrl:
                                    AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                                height: 125,
                             width: 150,
                             imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.only(topRight: Radius.circular(30.0),
                               bottomLeft: Radius.circular(30.0),),image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
                                fit: BoxFit.cover,


                          ),
                             ),
                           ),


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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(

                              padding: EdgeInsets.only(left: 7),
                              child: Text("${translateDatabase(
                                  itemsModel.itemsPrice, itemsModel.itemsPriceD ,itemsModel.itemsPriceD)} ${"59".tr}",
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sans")),
                            ),
                            GetBuilder<FavoriteController>(
                                builder: (controller) => IconButton(
                                    onPressed: () {
                                      if (controller.isFavorite[itemsModel.itemsId] ==
                                          "1") {
                                        controller.setFavorite(
                                            itemsModel.itemsId, "0");
                                        controller
                                            .removeFavorite(itemsModel.itemsId!);
                                      } else {
                                        controller.setFavorite(
                                            itemsModel.itemsId, "1");
                                        controller.addFavorite(itemsModel.itemsId!);
                                      }
                                    },
                                    icon: Icon(
                                      controller.isFavorite[itemsModel.itemsId] == "1"
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: AppColor.primaryColor,
                                    )))
                          ],
                        ),
                      )
                    ]),
              ),
           if (itemsModel.itemsDiscount != "0")   Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.saleOne , width: 40,))
            ],
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