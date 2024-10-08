import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/view/widget/home/ListNewitemshome.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:bazar/view/widget/home//SlideTopPage.dart';
import 'package:bazar/view/widget/customappbar.dart';
import 'package:bazar/view/widget/home/customtitlehome.dart';
import 'package:bazar/view/widget/home/listcategorieshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeShopeControllerImp controllerImp=    Get.put(HomeShopeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeShopeControllerImp>(
          builder: (controller) => Container(
              child:  CustomScrollView(
                controller: controllerImp.scrollController,
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.backgroundcolor,
                    primary: false,
                    actions:[ Image.asset(AppImageAsset.logo , width: 95,)],
                    snap: false,
                    stretch: true,
                    floating: true,
                    pinned: false,
                    centerTitle: false,
                    iconTheme: const IconThemeData(color: Colors.black),
                    title: Text("${'131'.tr}") ,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0), ), ),),
                  SliverList.list(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                            children: [
                              controllerImp.userBlock != "0" ? SizedBox()
                              :
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
                                            ImageSliderScreenTop(slideModel: controller.image,),
                                            controller.users.isEmpty ? Text("your account has been suspended")   :
                                                CustomTitleHome(title: "40".tr),


                                            ListCategoriesHome(),
                                            controller.users.isEmpty ? Text("your account has been suspended")   :
                                            // OthersView() ,
                                            // CustomTitleHome(title: "41".tr),
                                            // ListItemsHome(),
                                            // CustomTitleHome( title: 'Offers',),
                                            // ImageSliderScreenMiddle(slideModel: controller.image,),
                                            CustomTitleHome(title: "41".tr),
                                            ListNewItemsHome(),

                                          ],
                                        )
                                      : ListItemsSearch(listdatamodel: controller.listdata,)
                                      )

                              // const CustomTitleHome(title: "Offer"),
                              // const ListItemsHome()
                            ],
                          ),
                      ),
                    ],
                  ),
                ],
              ),
              )),
    );
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
            splashColor: Colors.white,
            hoverColor: Colors.white,
            focusColor: Colors.white,
            highlightColor: Colors.white,
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index] , index);
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
