import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeShopeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 1),
        itemCount: controller.shope.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
            CategoriesModel.fromJson(controller.shope[index]),
            shopemodel:
            shopesmodel.fromJson(controller.shope[index]),
          );
        },
      ),
    );
  }
}



class Categories extends GetView<HomeShopeControllerImp> {
  final CategoriesModel categoriesModel;
  final shopesmodel shopemodel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel,required this.shopemodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      controller.goToItems( controller.shope, i! , shopemodel.shopesId!  );
      },
      // highlightColor: AppColor.backgroundcolor,
      // splashColor: AppColor.backgroundcolor,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            child: CachedNetworkImage(
              imageUrl:
              AppLink.imagestShopes + "/" + shopemodel.shopesImage!,

              imageBuilder: (context,imageProvider)=>Container(decoration: BoxDecoration(borderRadius:BorderRadius.all( Radius.circular(50.0),)
                  ,image: DecorationImage(image:imageProvider , centerSlice: Rect.largest )),),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 80,
            // height:50,
            padding: EdgeInsets.only(left:10, right: 10),
            alignment: Alignment.center,
            child: Text(
              "${translateDatabase(shopemodel.shopesNameAr, shopemodel.shopesName , shopemodel.shopesNameRu)}",
              style: const TextStyle(fontSize: 11, color: AppColor.black ,
                overflow: TextOverflow.clip
              ),
            ),
          )
        ],
      ),
    );
  }
}
