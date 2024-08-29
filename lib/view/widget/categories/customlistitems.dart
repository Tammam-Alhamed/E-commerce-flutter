import 'package:bazar/view/Support/Images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/controller/categories_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/categoriesmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';

class CustomListcategories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  // final bool active;
  final int? i;
  const CustomListcategories( {Key? key,this.i, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        highlightColor: Colors.white,
        onTap: () {
          categoriesModel.comingsoon!="0" ? "" :  controller.goToItems(controller.categories, i , categoriesModel.categoriesId! );
        },
        child: InkWell(
          //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),

          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                 //   crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        margin:EdgeInsets.only(bottom: 5, top: 0),
                        child: Images(
                          url: AppLink.imagestCategories + "/" + categoriesModel.categoriesImage!,
                          raduis: 6.0,
                        ),
                      ),
                     Container(
                          margin: EdgeInsets.symmetric(vertical:2,horizontal:2),
                          alignment: Alignment.center,
                         // padding:EdgeInsets.all(3),

                          child: Text(

                              translateDatabase(
                                  categoriesModel.categoriesNamaAr, categoriesModel.categoriesName , categoriesModel.categoriesNamaRu),
                              style: const TextStyle(
                                  height: 1,
                                  color: AppColor.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      if (categoriesModel.comingsoon !="0")
                        Text( translateDatabase("🎁قريباً","Coming Soon🎁","Вскоре🎁"), style:  TextStyle(  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, fontSize: 12,)),



                    ]),
              ),
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