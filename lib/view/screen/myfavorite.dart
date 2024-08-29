import 'package:bazar/controller/myfavoritecontroller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/view/widget/customappbar.dart';
import 'package:bazar/view/widget/myfavorite/customlistfavoriteitems1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp() ,permanent: true);

    return WillPopScope(
      onWillPop: () {
        return Future<bool>.value(Get.delete<MyFavoriteControllerImp>(force: true));
      },
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteControllerImp>(
              builder: ((controller) => ListView(children: [
                    CustomAppBar(
                      mycontroller: controller.search!,
                      titleappbar: "39".tr,
                      iconData: Icons.arrow_forward,
                      // onPressedIcon: () {},
                      onPressedSearch: () {
                        controller.onSearchItems();
                      },
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                      onPressedIconFavorite: () {
                        Get.offAllNamed(AppRoute.homepage);
                      },
                      onPressed: (String ) { controller.onSearchItems(); },
                      container: SizedBox(),
                    ),
                    const SizedBox(height: 20),
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            return CustomListFavoriteItems(
                                itemsModel: controller.data[index],
                              itemsModel1: controller.dataitem[index], itemnum: index,);
                          },
                        ))
                  ]))),
        ),
      ),
    );
  }
}
