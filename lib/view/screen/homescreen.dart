import 'dart:io';
import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/functions/alertexitapp.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/view/widget/home/custombottomappbarhome.dart';
import 'package:bazar/view/widget/home/others.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void send()async{
      var contactusWhatsapp= "+961 70542149";
      var whatappURLIos =
      Uri.parse('https://wa.me/$contactusWhatsapp?text=${Uri.parse("hello")}');
      var whatsappApp = Uri.parse("whatsapp://send?phone=$contactusWhatsapp&text=hello");
      if(Platform.isIOS) {
        if (await canLaunchUrl(whatappURLIos)) {
          await launchUrl(whatappURLIos);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
        }

      }else

      if (await launchUrl(whatsappApp)) {
        await launchUrl(whatsappApp);
      }/* else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("WhatsApp is not installed on the device"),
          ),
        );
      }*/
    }
    MyServices myServices = Get.find();
    Get.put(HomeScreenControllerImp());
    return
      GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => AnnotatedRegion<SystemUiOverlayStyle>(
            value:const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, //i like transaparent :-)
              systemNavigationBarColor: AppColor.backgroundcolor, // navigation bar color
              statusBarIconBrightness: Brightness.dark, // status bar icons' color
              systemNavigationBarIconBrightness:Brightness.dark, //navigation bar icons' color
            ),
            child: Scaffold (
              appBar: AppBar(
                backgroundColor: AppColor.backgroundcolor,
                leadingWidth: 0,
                centerTitle : true,
                automaticallyImplyLeading: false,
                bottomOpacity: 0,
                toolbarHeight: 0,
                toolbarOpacity: 0,
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.bottomSheet(
                        enterBottomSheetDuration: const Duration(milliseconds: 325),
                        exitBottomSheetDuration : const Duration(milliseconds: 325),
                        StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                height: 350,
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                  color: AppColor.backgroundcolor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                ),
                                child:Column(

                                  children: [
                                    Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: double.infinity,
                                        ),
                                        alignment: Alignment.center,
                                        margin:const EdgeInsets.all(10) ,
                                        padding:const EdgeInsets.all(10) ,
                                        child: Text("46".tr, style: const TextStyle(fontSize: 17,height: 1.2,fontWeight: FontWeight.bold,color: AppColor.primaryColor))),
                                    const SizedBox(height: 20),
                                    Flexible(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Others(
                                              color: Colors.green.shade400,
                                              button:BoxIcons.bxl_whatsapp,
                                              onPressed: () {
                                                send();
                                              }),
                                          Others(
                                              color: Colors.blue.shade400,
                                              button:BoxIcons.bxl_telegram,
                                              onPressed: () {
                                                launch(
                                                    "https://t.me/Bazaar0app0");
                                              }),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),);} ));
                  },
                  child: const Icon(Iconsax.magicpen_outline , color: Colors.white, size: 30,)),

              floatingActionButtonLocation:
              myServices
                  .sharedPreferences
                  .getString("lang") ==
                  'ar' ?
              controller.currentpage == 3 ?
              FloatingActionButtonLocation.startFloat
                  :
              FloatingActionButtonLocation.centerDocked
              :
                  controller.currentpage == 3 ?
                  FloatingActionButtonLocation.endFloat
                  :
              FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar: const CustomBottomAppBarHome(),
              body:  WillPopScope(
                  onWillPop: () async {
                    // Check if we can pop (i.e., go back)
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();  // Pop the current page
                      return false; // Prevent the default behavior
                    } else {
                      // Show exit message
                      Get.defaultDialog(
                          title: "101".tr,
                          titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
                          middleText: "108".tr,
                          middleTextStyle: const  TextStyle(color: AppColor.black),
                          actions: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(AppColor.primaryColor)),
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: Text("109".tr ,style: TextStyle(color: Colors.white),)
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(AppColor.primaryColor)),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("110".tr,style: TextStyle(color: Colors.white),))
                          ]);
                      return Future.value(true);// Exit if user confirms, else do nothing
                    }
                  },
                  child: controller.listPage.elementAt(controller.currentpage)),

            ),
          ));
  }
}
