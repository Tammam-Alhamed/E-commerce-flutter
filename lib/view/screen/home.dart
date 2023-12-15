import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/screen/othersview.dart';
import 'package:ecommercecourse/view/screen/slideimage.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeShopeControllerImp controllerImp=    Get.put(HomeShopeControllerImp());
    Future  ref()async{

      controllerImp.reff()  ;
    }
    return GetBuilder<HomeShopeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child:  ListView(
                physics: AlwaysScrollableScrollPhysics(),
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
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ?  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                ImageSliderScreen(slideModel: controller.image,),
                                Row(
                                  children: [
                                    CustomTitleHome(title: "40".tr),
                                  ],
                                ),
                                ListCategoriesHome(),
                                OthersView(),
                                CustomTitleHome(title: "41".tr),
                                ListItemsHome(),
                              ],
                            )
                          : ListItemsSearch(listdatamodel: controller.listdata)
                          )

                  // const CustomTitleHome(title: "Offer"),
                  // const ListItemsHome()
                ],
              ),
            ));
  }
}

class ListItemsSearch extends GetView<HomeShopeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],


                ),
              )),
            ),
          );
        });
  }
}
