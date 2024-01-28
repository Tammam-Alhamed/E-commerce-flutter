import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/categoriesmodel.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/categories/customlistitems.dart';
import 'package:ecommercecourse/view/widget/categories/listcategoirseitems.dart';
import 'package:ecommercecourse/view/widget/categories/listshope.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/items/customlistitems.dart';
import 'package:ecommercecourse/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../controller/categories_controller.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "39".tr,
            // onPressedIcon: () {},
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedIconFavorite: () {
              Get.toNamed(AppRoute.myfavroite);
            },
            onPressed: (String ) { controller.onSearchItems(); },
            container:Container(
              alignment:Alignment.center ,
            decoration: BoxDecoration(
                color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: EdgeInsets.symmetric(horizontal: 6),

            child: ListShope(onChange:controller.changeShopee),
          ),
          ),
          const SizedBox(height: 20),
        //  const ListCategoriesShops(),
          GetBuilder<CategoriesControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? AnimationLimiter(
                        child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (BuildContext context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 900),
                            columnCount: controller.data.length,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                child: CustomListcategories(
                                    categoriesModel: CategoriesModel.fromJson(
                                        controller.data[index])),
                              ),
                            ),
                          );
                        }),
                      )
                      : ListItemsSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}





















// favoriteController.isFavorite[controller.data[index]
// ['items_id']] = controller.data[index]['favorite'];
