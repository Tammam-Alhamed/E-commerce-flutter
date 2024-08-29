import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Size size = MediaQuery.of(context).size;
    List listOfIcons = [
      Iconsax.home_1_outline,
      Iconsax.notification_outline,
      Icons.shopping_cart_outlined.fontFamilyFallback,
      Iconsax.shopping_cart_outline,
      Iconsax.user_outline,
    ];

    List listOfIconsBold = [
      Iconsax.home_1_bold ,
      Iconsax.notification_bold,
      Icons.shopping_cart_outlined.fontFamilyFallback,
      Iconsax.shopping_cart_bold,
      Iconsax.user_bold,
    ];
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Container(
          height: size.width * .155,
          child: Container(

            decoration: BoxDecoration(
                color: AppColor.backgroundcolor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 100,
                      offset: const Offset(0,10)
                  ),
                ],

            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listPage.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .050),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                int i = index > 4 ? index - 1 : index;
                i != 3 && i !=2 ?Get.delete<CartController>(force: true) : "";
                i!=2 ? controller.changePage(i) : "";
                i != 1 ?  print(myServices.sharedPreferences.getInt('unreadCount')) : myServices.sharedPreferences.remove('unreadCount');
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == controller.currentpage ? 0 : size.width * .029,
                      right: size.width * .0200,
                      left: size.width * .0325,
                    ),
                    width: size.width * .130,
                    height: index == controller.currentpage ? size.width * .018 : 0,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      if(index == 1)
                        if(myServices.sharedPreferences.getInt('unreadCount') == 0)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child:  const Icon(Icons.brightness_1_rounded, size: 15.0,
                                color: Colors.red),
                          )
                          ),
                      Icon(
                        controller.currentpage != index ?listOfIcons[index] :listOfIconsBold[index],
                        size: size.width * .076,
                        color: index == controller.currentpage
                            ? AppColor.sky
                            : Colors.black38,
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
                  ),
          ),
        ));
  }
}





