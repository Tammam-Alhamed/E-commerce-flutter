import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/screen/othersview.dart';
import 'package:ecommercecourse/view/screen/slideimage.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/widget/home/customcardhome.dart';
import 'package:ecommercecourse/view/widget/home/customtitlehome.dart';
import 'package:ecommercecourse/view/widget/home/listcategorieshome.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeShopeControllerImp());
    return GetBuilder<HomeShopeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
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
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ?  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              ImageSliderScreen(),
                              Row(
                                children: [
                                  CustomTitleHome(title: "40".tr),
                                  Flexible(child:

                                    Container(
                                      //padding: const EdgeInsets.symmetric(horizontal: 100),
                                        margin: EdgeInsets.only(right: 170),
                                      child: MaterialButton(
                                        color: AppColor.primaryColor,
                                        textColor: Colors.white,
                                         onPressed: () {
                                           Get.bottomSheet(Container(child: OthersView(),));
                                    },
                                        child:Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text("Others"),
                                           Container(width: 4,),
                                            Icon(Icons.format_indent_decrease),
                                          ],
                                        ),
                                  )))
                                ],
                              ),
                              ListCategoriesHome(),
                              CustomTitleHome(title: "41".tr),
                              ListItemsHome(),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata)
                        )

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
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
