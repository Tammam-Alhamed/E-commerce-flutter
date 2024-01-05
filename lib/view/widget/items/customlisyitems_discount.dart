import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CustomListItemsDiscount extends GetView<HomeShopeControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItemsDiscount({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                          imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(5.0),)
                              ,image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
                          imageUrl:
                          AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                          height: 150,
                          width: 150,
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

                        padding: EdgeInsets.only(left: 15 , right: 10),
                        margin: EdgeInsets.only(left: 15 , right: 10),
                        alignment: Alignment.center,
                        child: Text(
                            translateDatabase(
                                itemsModel.itemsNameAr, itemsModel.itemsName ,itemsModel.itemsNameRu),
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
                        padding: const EdgeInsets.only(left: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            if(itemsModel.itemsSold != "0")
                              Image.asset(AppImageAsset.Sold , width: 50,height: 55,)
                            else
                            if(itemsModel.itemsDiscount!="0")
                              Column(
                                children: [
                                  Text("${translateDatabase(
                                      itemsModel.itemspricedisount_d, itemsModel.itemspricedisount_d ,itemsModel.itemspricedisount_d)} ${"59".tr}",
                                      style: const TextStyle(
                                          color: AppColor.primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "sans")),
                                  Text("${translateDatabase(
                                      itemsModel.itemsPrice, itemsModel.itemsPrice,itemsModel.itemsPrice)} ${"59".tr}",
                                      style: const TextStyle(decoration: TextDecoration.lineThrough,
                                          color: AppColor.primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "sans"))],)

                            else
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("${translateDatabase(
                                    itemsModel.itemsPrice, itemsModel.itemsPrice,itemsModel.itemsPrice)} ${"59".tr}",
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
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