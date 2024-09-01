import 'package:bazar/controller/categories_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/view/widget/categories/listshope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:icons_plus/icons_plus.dart';

import 'categories/listshope.dart';
import 'items/floatingButtom.dart';

class CustomAppBarItems extends StatelessWidget {

  final void Function()? onPressedIconFavorite;

  final void Function(String)? onPressed;


  final IconData iconData ;


  const CustomAppBarItems(
      {Key? key,


        required this.onPressedIconFavorite,

         this.iconData =   Iconsax.heart_outline, this.onPressed,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height:50,
      color:AppColor.backgroundcolor,
      margin: EdgeInsets.only(top: 10),
      child:
      Scaffold(

        backgroundColor: AppColor.backgroundcolor,

        body: Row(children: [

          SizedBox(width: 10),
          IconButton(
            iconSize: 20,
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),

          SizedBox(width: 10),
          Container(child: TextButton(
            child: Text(
              "Sort",

            ),
            onPressed: () {
              Get.bottomSheet(
                  backgroundColor:Colors.white,
                  enterBottomSheetDuration:const Duration(milliseconds: 325),
                  exitBottomSheetDuration :const Duration(milliseconds: 325),
                  StatefulBuilder(
                      builder: (context, setState) {
                        return Container(height:350,child: RadioListTileExample());}));
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColor.primaryColor,
              elevation: 2,
            ),
          ),),

          SizedBox(width: 8),

          Container(
            decoration: BoxDecoration(
                color: AppColor.backgroundcolor, borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  iconData,
                  size: 21,
                  color: Colors.grey[600],
                )),
          ),






        ]),
      ),
    );
  }
}


// Container(
// decoration: BoxDecoration(
// color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
// width: 60,
// padding: EdgeInsets.symmetric(vertical: 8),
//
// child: shopes,
// ),