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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../widget/items/floatingButtom.dart';

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
                width: 60,
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
                            ? AnimationLimiter(
                              child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.6),
                              itemBuilder: (BuildContext context, index) {
                                // controller.data[index]['items_discount'] = controller.discount;
                                controllerFav.isFavorite[controller.data[index]
                                ['items_id']] =
                                controller.data[index]['favorite'];
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  duration: const Duration(milliseconds: 900),
                                  columnCount: controller.data.length,
                                  child: SlideAnimation(
                                    curve: Curves.ease,
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: CustomListItems(
                                          itemsModel: ItemsModel.fromJson(
                                              controller.data[index])),
                                    ),
                                  ),
                                );
                              }),
                            )
                            : ListItemsSearch(
                            listdatamodel: controller.listdata))),


          ]),
        ),
        floatingActionButton:  SpeedDial(
          childrenButtonSize : const Size(60.0, 70.0),
          animatedIcon: AnimatedIcons.menu_close,
            spaceBetweenChildren:10,
          animatedIconTheme: const IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: true,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,

          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: const CircleBorder(),
          children: [
            SpeedDialChild(
                child: const Icon(Icons.sort_sharp, color:AppColor.primaryColor),
                backgroundColor: Colors.yellow,
                label: 'Sort',
          labelBackgroundColor:Colors.white,
                labelStyle: const TextStyle(fontSize: 18.0,color:AppColor.primaryColor),
                onTap: () {
    Get.bottomSheet(
        backgroundColor:Colors.white,
    enterBottomSheetDuration:const Duration(milliseconds: 325),
    exitBottomSheetDuration :const Duration(milliseconds: 325),
    StatefulBuilder(
    builder: (context, setState) {
    return Container(height: 255,child:const RadioListTileExample());}));}
            ),
           /* SpeedDialChild(
              child: Icon(Icons.filter_alt_rounded, color:AppColor.primaryColor,),
              backgroundColor:Colors.yellow,
              label: 'Filter',
              labelBackgroundColor:Colors.white,
              labelStyle:  TextStyle(fontSize: 18.0,color:AppColor.primaryColor),
              onTap: () {

                Get.bottomSheet(
                    backgroundColor:Colors.white,
                    enterBottomSheetDuration: Duration(milliseconds: 325),
                    exitBottomSheetDuration : Duration(milliseconds: 325),
                    StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            height: 255,
                              child: RadioListTileExample());}));},
            ),*/

          ],
        ),


      );
  }
}





















// favoriteController.isFavorite[controller.data[index]
                            // ['items_id']] = controller.data[index]['favorite'];
