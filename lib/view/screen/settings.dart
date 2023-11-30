import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/screen/othersview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                    height: Get.width / 3, color: AppColor.primaryColor
                ),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage(AppImageAsset.avatar),
                      ),
                    )),
              ]),
          SizedBox(height: 100),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.black.withOpacity(0.3),
                      spreadRadius:2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                      blurStyle: BlurStyle.solid// changes position of shadow
                  ),
                ],
                border: Border.all(color: Colors.white10 , width: 1.5),
                color: AppColor.backgroundcolor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // ListTile(
                //   onTap: () {},
                //   trailing: Switch(onChanged: (val) {}, value: true),
                //   title: Text("Disable Notificatios"),
                // ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("54".tr),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive );
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("55".tr),
                ),
                // ListTile(
                //   onTap: () {
                //     Get.toNamed(AppRoute.addressview);
                //   },
                //   trailing: Icon(Icons.location_on_outlined),
                //   title: Text("Address"),
                // ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("56".tr),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet( OthersView());

                  },
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("57".tr),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("58".tr),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
