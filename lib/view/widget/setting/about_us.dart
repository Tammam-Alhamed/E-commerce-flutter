


import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/color.dart';
import '../../../core/localization/changelocal.dart';

class About_us extends GetView<LocaleController> {
  const  About_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       color: AppColor.backgroundcolor,
       borderRadius: BorderRadius.only(
           topLeft: Radius.circular(30),
           topRight: Radius.circular(30)),
     ),

     padding: EdgeInsets.only(top: 10,left: 10,right: 15),
     child: Column(
       mainAxisAlignment :MainAxisAlignment.center,
       crossAxisAlignment : CrossAxisAlignment.center,
       children: [
         PhysicalModel(
           color: AppColor.secondColor,
           elevation: 10,
           shadowColor: AppColor.primaryColor,
           borderRadius: BorderRadius.circular(20),
           child: Container(

               padding: EdgeInsets.all(10),
               child: Text("3".tr)

           ),
         ),
         SizedBox(height: 19,),
         PhysicalModel(
           color: AppColor.secondColor,
           elevation: 10,
           shadowColor: AppColor.primaryColor,
           borderRadius: BorderRadius.circular(20),
           child: Container(
               padding: EdgeInsets.all(10),
               child: Text("5".tr)

           ),
         ),
         SizedBox(height: 19,),
         PhysicalModel(
           color: AppColor.secondColor,
           elevation: 10,
           shadowColor: AppColor.grey2,
           borderRadius: BorderRadius.circular(20),
           child: Container(
               padding: EdgeInsets.all(10),
               child: Text("7".tr)

           ),
         ),
       ],
     ),
   );

  }
}