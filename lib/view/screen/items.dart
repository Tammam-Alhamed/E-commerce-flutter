import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/widget/categories/listshope.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/items/customlistitems.dart';
import 'package:ecommercecourse/view/widget/items/listCat.dart';
import 'package:ecommercecourse/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      ItemsControllerImp controller = Get.put(ItemsControllerImp());
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
              container: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                width: 40,
                padding: EdgeInsets.symmetric(horizontal: 6),

                child: ListCat(onChange: controller.changeCat),
              ),
            ),
            const SizedBox(height: 20),
            // const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) =>
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                            itemBuilder: (BuildContext context, index) {
                              // controller.data[index]['items_discount'] = controller.discount;
                              controllerFav.isFavorite[controller.data[index]
                              ['items_id']] =
                              controller.data[index]['favorite'];
                              return CustomListItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.data[index]));
                            })
                            : ListItemsSearch(
                            listdatamodel: controller.listdata)))
          ]),
        ),
      );
  }
}





















// favoriteController.isFavorite[controller.data[index]
                            // ['items_id']] = controller.data[index]['favorite'];
