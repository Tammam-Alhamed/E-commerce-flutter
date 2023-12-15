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
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.decimalPattern();
    print(f.format(12.345));

    controller.discount =  itemsModel.itemsDiscount ;
    print(controller.discount);
    return InkWell(

        onTap: () {
          print("==============================");
          itemsModel.itemsSold !="0" ? "" :controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          // margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),


          child: Stack(
            children: [
              Padding(
               padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                              Container(
                               margin:EdgeInsets.only(bottom: 5 , top: 6),

                               child: CachedNetworkImage(
                                imageUrl:
                                    AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                                height: 150,
                             width: 150,

                                fit: BoxFit.fill,


                          ),
                             ),

                      SizedBox(height: 5,),

                      Container(
                        padding: EdgeInsets.only(left: 5 , right: 10),
                        margin: EdgeInsets.only(left: 5 , right: 10),
                        alignment: Alignment.center,
                        child: Text(
                            translateDatabase(
                                itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
                            textAlign:TextAlign.center,
                            style: const TextStyle(
                              height: 1,
                              overflow: TextOverflow.clip,
                                color: AppColor.black,
                                fontSize: 16,
                            )),
                      ),






                         if( itemsModel.itemsDiscount == "0")
                         SizedBox(height: 10,),

                         Padding(
                           padding: const EdgeInsets.only(left: 3),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if(itemsModel.itemsSold != "0")
                                       Image.asset(AppImageAsset.Sold , width: 75,height: 80,)
                                else
                                if(itemsModel.itemsDiscount!="0")
                                    Column(
                                        children: [
                                      Text("${translateDatabase(
                                          itemsModel.itemsPriceDiscount, itemsModel.itemspricedisount_d ,itemsModel.itemspricedisount_d)} ${"59".tr}",
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "sans")),
                                          Text("${translateDatabase(
                                              itemsModel.itemsPrice, itemsModel.itemsPriceD,itemsModel.itemsPriceD)} ${"59".tr}",
                                              style: const TextStyle(decoration: TextDecoration.lineThrough,
                                                  color: AppColor.primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "sans"))],)


                                  else Padding(
    padding: const EdgeInsets.only(left: 7),
    child: Text("${translateDatabase(
        itemsModel.itemsPrice, itemsModel.itemsPriceD,itemsModel.itemsPriceD)} ${"59".tr}",
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 12,
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
                         ),


                    ]),
              ),
           if (itemsModel.itemsDiscount != "0")   Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.saleOne , width: 40,)),
              if (itemsModel.itemsNew == "1")   Positioned(
                  top: -2,
                  right: -2,
                  child: Image.asset(AppImageAsset.NEW , width: 50,))
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