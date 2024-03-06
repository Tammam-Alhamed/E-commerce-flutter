import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/data/model/categoriesmodel.dart';
import 'package:bazar/view/screen/home.dart';
import 'package:bazar/view/widget/categories/customlistitems.dart';
import 'package:bazar/view/widget/categories/listshope.dart';
import 'package:bazar/view/widget/customappbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../controller/categories_controller.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp() , permanent: true);
    return WillPopScope(
      onWillPop: () async{
        return Future<bool>.value(Get.delete<CategoriesControllerImp>(force: true));
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
                            kIsWeb ? const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 0.6)
                                :
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 500),
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
        ),
      ),
    );
  }
}





















// favoriteController.isFavorite[controller.data[index]
// ['items_id']] = controller.data[index]['favorite'];
