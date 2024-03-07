import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List listOfIcons = [
      Icons.home_rounded,
      Icons.notifications_active_rounded,
      Icons.shopping_cart_outlined.fontFamilyFallback,
      Icons.shopping_cart_outlined,
      Icons.person_rounded,
    ];
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Container(
          height: size.width * .155,
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 0),
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
          child: Container(

            decoration: BoxDecoration(
                color: AppColor.backgroundcolor,
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
                      // if(index == 1)
                      //   Positioned(
                      //     top: -13,
                      //     left: 10.5,
                      //     child: Container(
                      //       margin: const EdgeInsets.symmetric(vertical: 12),
                      //       child:  Text('${controller.count_notification}',
                      //           style:const TextStyle(
                      //               fontSize: 18,
                      //               color: AppColor.primaryColor,
                      //               fontWeight: FontWeight.bold)),
                      //     ),
                      //   ),
                      Icon(
                        listOfIcons[index],
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
              ),
        ));
  }
}





