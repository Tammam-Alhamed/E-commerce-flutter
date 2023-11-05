import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesShops extends GetView<CategoriesControllerImp> {
  const ListCategoriesShops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.shopes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            Shopesmodel:
            shopesmodel.fromJson(controller.shopes[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<CategoriesControllerImp> {
  final shopesmodel Shopesmodel;
  final int? i;
  const Categories({Key? key, required this.Shopesmodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeShope(i!, Shopesmodel.shopesId!);
      },
      child: Column(
        children: [
          GetBuilder<CategoriesControllerImp>(
              builder: (controller) => Container(
                    padding:const  EdgeInsets.only(right: 10, left: 10, bottom: 5),
                    decoration: controller.selectedShope == i
                        ? BoxDecoration(borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 50
                            ))
                        : null,
                    child: Text(
                      "${translateDatabase(
                          Shopesmodel.shopesNameAr,
                          Shopesmodel.shopesName,
                          Shopesmodel.shopesNameRu)}",
                      style:
                          const TextStyle(fontSize: 20, color: AppColor.grey2),
                    ),
                  ))
        ],
      ),
    );
  }
}
