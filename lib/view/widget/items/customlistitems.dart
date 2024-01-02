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
    String formatAmount(){
      String price = "${translateDatabase(
          itemsModel.itemsPriceD, itemsModel.itemsPriceD,itemsModel.itemsPriceD)}";
      String priceInText = "";
      int counter = 0;
      for(int i = (price.length - 1);  i >= 0; i--){
        counter++;
        String str = price[i];
        if((counter % 3) != 0 && i !=0){
          priceInText = "$str$priceInText";
        }else if(i == 0 ){
          priceInText = "$str$priceInText";

        }else{
          priceInText = ",$str$priceInText";
        }
      }
      return priceInText.trim();
    }
    String formatAmount1(){
      String price = "${translateDatabase(
          itemsModel.itemspricedisount_d, itemsModel.itemspricedisount_d ,itemsModel.itemspricedisount_d)}";
      String priceInText = "";
      int counter = 0;
      for(int i = (price.length - 1);  i >= 0; i--){
        counter++;
        String str = price[i];
        if((counter % 3) != 0 && i !=0){
          priceInText = "$str$priceInText";
        }else if(i == 0 ){
          priceInText = "$str$priceInText";

        }else{
          priceInText = ",$str$priceInText";
        }
      }
      return priceInText.trim();
    }

    var f = NumberFormat.decimalPattern();

    controller.discount =  itemsModel.itemsDiscount ;

    return InkWell(
      highlightColor: Colors.white,
        onTap: () {
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
                                 imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(5.0),)
                                     ,image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                    child: Image.asset( translateDatabase(
                                        AppImageAsset.Sold_a, AppImageAsset.Sold ,AppImageAsset.Sold_r),width: 75,height: 80,),
                                  )
                                       //Image.asset(AppImageAsset.Sold , width: 75,height: 80,)
                                else
                                if(itemsModel.itemsDiscount!="0")
                                    Column(
                                        children: [
                                      Text("${formatAmount1()} ${"59".tr}",
                                          style: const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "sans")),
                                          Text("${formatAmount()} ${"59".tr}",
                                              style: const TextStyle(decoration: TextDecoration.lineThrough,
                                                  color: AppColor.primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "sans"))],)


                                  else Padding(
    padding: const EdgeInsets.only(left: 7),
    child: Text("${formatAmount()} ${"59".tr}",
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