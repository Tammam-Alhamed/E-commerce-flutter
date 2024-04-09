import 'package:bazar/controller/notification_controller.dart';
import 'package:bazar/core/class/handlingdataview.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/translatefatabase.dart';
import 'package:bazar/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: Center(
            child: Text(
              "45".tr,
            )),
      ),
      body: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(

                  padding: const EdgeInsets.only(left: 3),
                  child:  RefreshIndicator(
                    onRefresh:ref,
                    child: AnimationLimiter(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                          children: [

                        const SizedBox(height: 10),

                        ...List.generate(
                            controller.data.length,
                            (index) => AnimationConfiguration.staggeredList(
                              position: index,
                              delay: Duration(milliseconds: 100),
                              child: SlideAnimation(
                                duration: Duration(milliseconds: 2500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                horizontalOffset: 30,
                                verticalOffset: 300.0,
                                child: FlipAnimation(
                                  duration: Duration(milliseconds: 3000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  flipAxis: FlipAxis.y,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 2 , right: 5),
                                        margin: const EdgeInsets.symmetric(vertical: 5),
                                        child: Stack(

                                          children: [
                                            Card(
                                              color: Colors.white,
                                              elevation: 2.5,
                                              shadowColor: AppColor.fourthColor,

                                              child: Container(
                                                constraints: const BoxConstraints(
                                                  maxHeight: double.infinity,
                                                ),

                                                child: ListTile(
                                                  title: Text(  controller.data[index]
                                                  ['notification_title'],
                                                  style: TextStyle(fontSize: 16),),
                                                  subtitle: Text(translateDatabase(controller.data[index]
                                                  ['notification_body'],controller.data[index]
                                                  ['notification_body_en'],controller.data[index]
                                                  ['notification_body_ru'])),
                                                ),
                                              ),
                                            ),

                                            if( sharedPrefLang == "ar")
                                            Positioned(
                                                left:11,
                                                child: Text(
                                                  "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                                  style:const TextStyle(
                                                      color: AppColor.primaryColor,
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            if( sharedPrefLang == "en")
                                              Positioned(
                                                  right: 11,
                                                  child: Text(
                                                    "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                                    style:const TextStyle(
                                                        color: AppColor.primaryColor,
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                            if( sharedPrefLang == "ru")
                                              Positioned(

                                                  right: 11,
                                                  child: Text(
                                                    "${Jiffy.parse(controller.data[index]['notification_datetime'], pattern: "yyyy-MM-dd").fromNow()}",
                                                    style:const TextStyle(
                                                        color: AppColor.primaryColor,
                                                        fontWeight: FontWeight.bold),
                                                  )),


                                          ],
                                        ),
                                      ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                  )))),
    );
  }


}
