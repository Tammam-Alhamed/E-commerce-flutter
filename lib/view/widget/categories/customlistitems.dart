import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListcategories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  // final bool active;
  final int? i;
  const CustomListcategories( {Key? key,this.i, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          print(i);
          controller.goToItems(controller.categories, i , categoriesModel.categoriesId!);
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColor.fourthColor.withOpacity(0.3),
                  spreadRadius:1,
                  blurRadius: 20,
                  offset: Offset(0, 2),
                  blurStyle: BlurStyle.solid// changes position of shadow
              ),
            ],
            border: Border.all(color: AppColor.thirdColor , width: 1.5),
            color: AppColor.backgroundcolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45.0),
              bottomLeft: Radius.circular(45.0),
            ),
          ),
          padding:EdgeInsets.all(7),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          imageUrl:
                              AppLink.imagestCategories + "/" + categoriesModel.categoriesImage!,
                          height: 120,
                          imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.only(topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),),image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),

                     Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          alignment: Alignment.center,
                          padding:EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.fourthColor.withOpacity(0.3),
                                  spreadRadius:2,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                  blurStyle: BlurStyle.inner// changes position of shadow
                              ),
                            ],
                            border: Border.all(color: AppColor.thirdColor , width: 1.5),
                            color: AppColor.backgroundcolor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0),
                              bottomLeft: Radius.circular(25.0),
                            ),
                          ),

                          child: Text(
                              translateDatabase(
                                  categoriesModel.categoriesNamaAr, categoriesModel.categoriesName , categoriesModel.categoriesNamaRu),
                              style:  TextStyle(

                                  color: AppColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),



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