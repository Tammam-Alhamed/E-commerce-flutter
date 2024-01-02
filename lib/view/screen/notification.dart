import 'package:ecommercecourse/controller/notification_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationView extends GetView< NotificationController> {
  const NotificationView({super.key});

Future  ref()async{

 controller.ref()  ;
}
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    NotificationController controller = Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(

                  padding: const EdgeInsets.only(left: 3),
                  child:  RefreshIndicator(
                    onRefresh:ref,
                    child: ListView(children: [

                       Center(
                          child: Text(
                        "45".tr,
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(height: 10),

                      ...List.generate(
                          controller.data.length,
                          (index) => Container(
                            padding: EdgeInsets.only(left: 2 , right: 5),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Stack(

                                  children: [
                                    PhysicalModel(
                                      color: AppColor.secondColor,
                                      elevation: 5,
                                      shadowColor: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),

                                        child: ListTile(
                                          title: Text(  controller.data[index]
                                          ['notification_title'],),
                                          subtitle: Text(translateDatabase(controller.data[index]
                                              ['notification_body'],controller.data[index]
                                          ['notification_body_en'],controller.data[index]
                                          ['notification_body_ru'])),
                                        ),
                                      ),
                                    ),

                                    if( sharedPrefLang == "ar")
                                    Positioned(

                                        left:5,
                                        child: Text(
                                          "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                          style:const TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    if( sharedPrefLang == "en")
                                      Positioned(
                                          right: 5,
                                          child: Text(
                                            "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                            style:const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    if( sharedPrefLang == "ru")
                                      Positioned(

                                          right: 5,
                                          child: Text(
                                            "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                            style:const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          )),


                                  ],
                                ),
                              ))
                    ]),
                  )))),
    );
  }


}
