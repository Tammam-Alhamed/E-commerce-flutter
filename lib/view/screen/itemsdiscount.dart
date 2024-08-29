import 'package:bazar/controller/favorite_controller.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/widget/customappbar.dart';
import 'package:bazar/view/widget/items/customlisyitems_discount.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ItemsDiscount extends StatelessWidget {
  const ItemsDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeShopeControllerImp controller = Get.put(HomeShopeControllerImp(),permanent: true);
    FavoriteController controllerFav = Get.put(FavoriteController() , permanent: true);

    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value:const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //i like transaparent :-)
          systemNavigationBarColor: Colors.white10, // navigation bar color
          statusBarIconBrightness: Brightness.dark, // status bar icons' color
          systemNavigationBarIconBrightness:Brightness.dark, //navigation bar icons' color
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.backgroundcolor,
            leadingWidth: 0,
            centerTitle : true,
            bottomOpacity: 0,
            toolbarHeight: 0,
            toolbarOpacity: 0,
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
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
                          ? AnimationLimiter(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                            kIsWeb ? const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5, childAspectRatio: 0.6)
                                :
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                            itemBuilder: (BuildContext context, index) {
                              // controller.data[index]['items_discount'] = controller.discount;
                              controllerFav.isFavorite[controller.data[index]
                              ['items_id']] =
                              controller.data[index]['favorite'];
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 600),
                                columnCount: controller.data.length,
                                child: SlideAnimation(
                                  verticalOffset: 40.0,
                                  child: FadeInAnimation(
                                    child: CustomListItemsDiscount(
                                        itemsModel: ItemsModel.fromJson(
                                            controller.data[index]), itemnum: index,),
                                  ),
                                ),
                              );
                            }),
                      )
                          : ListItemsSearch(listdatamodel: controller.listdata)))
            ]),
          ),
        ),
      ),
    );
  }
}