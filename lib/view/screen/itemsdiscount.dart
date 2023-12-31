import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/slides_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/categories/listshope.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/items/customlistitems.dart';
import 'package:ecommercecourse/view/widget/items/customlisyitems_discount.dart';
import 'package:ecommercecourse/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDiscount extends StatelessWidget {
  const ItemsDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeShopeControllerImp controller = Get.put(HomeShopeControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

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
            container: SizedBox(),
          ),
          const SizedBox(height: 20),
          // const ListCategoriesItems(),
          GetBuilder<HomeShopeControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]
                        ['items_id']] =
                        controller.data[index]['favorite'];
                        return CustomListItemsDiscount(
                            itemsModel: ItemsModel.fromJson(
                                controller.data[index]));
                      })
                      : ListItemsSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}