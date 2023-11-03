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
      var contactusWhatsapp= "963 937754196";
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
            elevation: 0,
            color: AppColor.backgroundcolor,
            textColor: AppColor.primaryColor,
            onPressed: () {
              Get.bottomSheet(
                  StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          height: 300,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          child:Column(

                            children: [
                              Container(
                                  decoration:
                                  BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(50),color: Colors.blue.shade200,boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 15), // Shadow position
                                    ),
                                  ], ),
                                  alignment: Alignment.center,
                                  margin:EdgeInsets.all(10) ,
                                  padding:EdgeInsets.all(10) ,
                                  child: Text("46".tr, style: TextStyle(fontSize: 17,height: 1,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade900))),
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
            child:Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Others"
                  ,style: TextStyle(
                    fontSize: 20
                ),
                ),
                Container(width: 4,),
                Icon(FontAwesome.amazon),
              ],
            ),

    );
  }
}
