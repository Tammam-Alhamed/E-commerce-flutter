import 'dart:io';

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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("WhatsApp is not installed on the device"),
          ),
        );
      }
    }


    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("46".tr, style: Theme.of(context).textTheme.headline1),
              const SizedBox(height: 20),
              Others(
                  button:BoxIcons.bxl_whatsapp,
                  onPressed: () {
                    send();
                  }),
              Others(
                  button:BoxIcons.bxl_telegram,
                  onPressed: () {
                    launch(
                        "https://t.me/RsuavsyBot");
                  }),
            ],
          )),
    );
  }
}
