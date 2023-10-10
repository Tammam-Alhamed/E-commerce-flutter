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
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${categoriesModel.categoriesId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              AppLink.imagestCategories + "/" + categoriesModel.categoriesImage!,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          translateDatabase(
                              categoriesModel.categoriesNamaAr, categoriesModel.categoriesName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),


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