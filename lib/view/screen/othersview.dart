import 'dart:io';

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/view/widget/home/others.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class OthersView extends GetView<LocaleController> {
  const OthersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void send()async{
      var contactusWhatsapp= "";
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


    return  MaterialButton(
      height: 80,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
            elevation: 15,
            color: AppColor.sky,
            textColor: AppColor.backgroundcolor,
            onPressed: () {
              Get.bottomSheet(
                  enterBottomSheetDuration: Duration(milliseconds: 325),
                  exitBottomSheetDuration : Duration(milliseconds: 325),
                  StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          height: 350,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundcolor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child:Column(

                            children: [
                              Container(
                                height: 100,
                                  decoration:
                                  BoxDecoration(border: Border.all(color: AppColor.grey2), borderRadius: BorderRadius.circular(30),color: AppColor.grey2 ,boxShadow: [
                                    BoxShadow(
                                      color: AppColor.grey2,
                                      blurRadius: 5,
                                      offset: Offset(0, 6), // Shadow position
                                    ),
                                  ], ),
                                  alignment: Alignment.center,
                                  margin:EdgeInsets.all(10) ,
                                  padding:EdgeInsets.all(10) ,
                                  child: Text("46".tr, style: TextStyle(fontSize: 17,height: 1.2,fontWeight: FontWeight.bold,color: AppColor.backgroundcolor))),
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
                                              "https://t.me/RsuavsyBot");
                                        }),
                                  ],
                                ),
                              ),

                            ],
                          ),);} ));
            },
            child:Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "118".tr
                  ,style: TextStyle(
                    fontSize: 20
                ),
                ),
                Container(width: 4,),
                Icon(FontAwesome.wand_magic_sparkles),
              ],
            ),

    );
  }
}
