import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
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
        child: Card(
          //margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),

          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:EdgeInsets.only(bottom: 10 , top: 6),
                        child: CachedNetworkImage(
                          imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(5.0),)
                              ,image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
                          imageUrl:
                              AppLink.imagestCategories + "/" + categoriesModel.categoriesImage!,
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


                     Container(
                          margin: EdgeInsets.symmetric(vertical:3,horizontal:3),
                          alignment: Alignment.center,
                         // padding:EdgeInsets.all(3),

                          child: Text(

                              translateDatabase(
                                  categoriesModel.categoriesNamaAr, categoriesModel.categoriesName , categoriesModel.categoriesNamaRu),
                              style: const TextStyle(
                                  height: 1,
                                  color: AppColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      if (categoriesModel.comingsoon !="0")
                        Text( translateDatabase("🎁قريباً","Coming Soon🎁","Вскоре🎁"), style:  TextStyle(  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, fontSize: 16,)),



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