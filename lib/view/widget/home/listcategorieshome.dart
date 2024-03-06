import 'package:bazar/view/Support/Images.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/data/model/categoriesmodel.dart';
import 'package:bazar/data/model/shopesmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeShopeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 106,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width:0),
        itemCount: controller.shope.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
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
      splashColor: Colors.white,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      highlightColor: Colors.white,
      onTap: () {
        controller.goToItems( controller.shope, i! , shopemodel.shopesId!  );
      },
      child: Column(
        children: [
          Container(
           margin:const EdgeInsets.only(right: 4) ,
            height: 70,
            width: 70,
            child: Images(
              url : AppLink.imagestShopes + "/" + shopemodel.shopesImage!,
              raduis: 22.0,
            ),
          ),
          Container(
            width: 80,
            // height:50,

            padding: const EdgeInsets.only(top: 3),
            alignment: Alignment.center,
            child: Text(textAlign: TextAlign.center,
              "${translateDatabase(shopemodel.shopesNameAr, shopemodel.shopesName , shopemodel.shopesNameRu)}",
              style: const TextStyle(height: 1.4,fontSize: 11, color: AppColor.black ,
              ),
            ),
          )
        ],
      ),
    );
  }
}
