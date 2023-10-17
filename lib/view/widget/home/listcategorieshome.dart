import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeShopeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "${AppLink.imagestShopes}/${shopemodel.shopesImage}",
                color: AppColor.secondColor),
          ),
          Text(
            "${translateDatabase(shopemodel.shopesNameAr, shopemodel.shopesName , shopemodel.shopesNameRu)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
