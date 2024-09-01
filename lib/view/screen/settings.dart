import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:bazar/controller/settings_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/view/widget/language/custombuttomlang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widget/setting/about_us.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // user card
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                    height: Get.width / 2.7,

                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Positioned(
                    top: Get.width / 4.1,
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
          SizedBox(
            height: 65,
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  Get.toNamed(AppRoute.orderspending);
                },
                icons: Iconsax.document_upload_bold,
                iconStyle: IconStyle(backgroundColor: AppColor.primaryColor),
                title: "54".tr,
                titleMaxLine: 1,
                subtitleMaxLine: 1,
              ),
              SettingsItem(
                onTap: () {
                  Get.toNamed(AppRoute.ordersarchive);
                },
                icons: CupertinoIcons.archivebox_fill,
                iconStyle: IconStyle(
                  backgroundColor: Color(0xda0748d2)
                ),
                title: "55".tr,
                titleMaxLine: 1,
                subtitleMaxLine: 1,
              ),
              SettingsItem(

                onTap: () {
                  //Get.bottomSheet( Term_and_Conditions());
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Container(
                          height: 680,
                          padding: EdgeInsets.all(10),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text("123".tr,
                                  style: TextStyle(color: Colors.black))));
                    },
                  );
                },
                icons: Icons.gavel_sharp,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: AppColor.thirdColor,
                ),
                title: "57".tr,
              ),
              SettingsItem(
                onTap: () {
                  Get.bottomSheet(About_us());
                },
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: AppColor.home
                ),
                title: "56".tr,
              ),
            ],
          ),

          // You can add a settings title
          SettingsGroup(
            settingsGroupTitle: "134".tr,
            items: [
              SettingsItem(
                onTap: () {
                  controller.logout();
                },
                icons: Icons.exit_to_app_rounded,
                title: "58".tr,
                iconStyle: IconStyle(iconsColor: Colors.red,backgroundColor: AppColor.secondColor),
                titleStyle: TextStyle(color: Colors.red),
              ),
              SettingsItem(
                onTap: () {
                  Get.bottomSheet(Container(
                    height: 300,
                    color: AppColor.backgroundcolor,
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1".tr,
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(height: 20),
                            CustomButtonLang(
                                textbutton: "العربية",
                                onPressed: () {
                                  controller.changeLang('ar');
                                }),
                            CustomButtonLang(
                                textbutton: "English",
                                onPressed: () {
                                  controller.changeLang('en');
                                }),
                            CustomButtonLang(
                                textbutton: "Русский",
                                onPressed: () {
                                  controller.changeLang('ru');
                                }),
                          ],
                        )),
                  ));
                },
                icons: Icons.language,
                title: "133".tr,
              ),
              // SettingsItem(
              //   onTap: () {},
              //   icons: CupertinoIcons.repeat,
              //   title: "Change email",
              // ),
              // SettingsItem(
              //   onTap: () {},
              //   icons: CupertinoIcons.delete_solid,
              //   title: "Delete account",
              //   titleStyle: TextStyle(
              //     color: Colors.red,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
          // SizedBox(height: 20,)
          Container(
            height: 150,
            child: Column(
              children: [
                Divider(
                  height: 12,
                ),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Brand(Brands.facebook),
                    Brand(Brands.instagram),
                    Brand(Brands.telegram_app),
                  ],
                ),
                SizedBox(height: 6,),
                Text("Bazaar 2024\n    V_1.0.0" ,
                  style: TextStyle(
                    color: Colors.black45

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// return Container(
//   child: ListView(
//     children: [
//       Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.center,
//           children: [
//             Container(
//                 height: Get.width / 3, color: AppColor.primaryColor
//             ),
//             Positioned(
//                 top: Get.width / 3.9,
//                 child: Container(
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(100)),
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.grey[100],
//                     backgroundImage: AssetImage(AppImageAsset.avatar),
//                   ),
//                 )),
//           ]),
//       SizedBox(height: 100),
//       Container(
//
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Container(
//           margin:EdgeInsets.only(top: 30) ,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   color: AppColor.black.withOpacity(0.3),
//                   spreadRadius:2,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                   blurStyle: BlurStyle.solid// changes position of shadow
//               ),
//             ],
//             border: Border.all(color: Colors.white10 , width: 1.5),
//             color: AppColor.backgroundcolor,
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           ),
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             // ListTile(
//             //   onTap: () {},
//             //   trailing: Switch(onChanged: (val) {}, value: true),
//             //   title: Text("Disable Notificatios"),
//             // ),
//             ListTile(
//               onTap: () {
//                 Get.toNamed(AppRoute.orderspending);
//               },
//               trailing: Icon(Icons.card_travel),
//               title: Text("54".tr),
//             ),
//             ListTile(
//               onTap: () {
//                 Get.toNamed(AppRoute.ordersarchive );
//               },
//               trailing: Icon(Icons.archive),
//               title: Text("55".tr),
//             ),
//              //ListTile(
//             //   onTap: () {
//             //     Get.toNamed(AppRoute.addressview);
//             //   },
//             //   trailing: Icon(Icons.location_on_outlined),
//             //   title: Text("Address"),
//             // ),
//             ListTile(
//               onTap: () {
//                 Get.bottomSheet( About_us(),
//                   enterBottomSheetDuration: Duration(milliseconds: 325),
//                   exitBottomSheetDuration : Duration(milliseconds: 325),);
//               },
//               trailing: Icon(Icons.help_outline_rounded),
//               title: Text("56".tr),
//             ),
//         ListTile(
//               onTap: () {
//                 //Get.bottomSheet( Term_and_Conditions());
//                showModalBottomSheet(
//                   isScrollControlled :true,
//                   context: context,
//                   builder: (context) {
//                     return Container(
//                       height:680,
//                       padding:EdgeInsets.all(10) ,
//
//
//                       child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Text("123".tr,style:TextStyle(color:Colors.black)))
//                     );
//                   },
//                 );
//
//               },
//               trailing: Icon(Icons.gavel),
//               title: Text("57".tr),
//             ),
//             ListTile(
//               onTap: () {
//                 controller.logout();
//               },
//               title: Text("58".tr),
//               trailing: Icon(Icons.exit_to_app),
//             ),
//           ]),
//         ),
//       )
//     ],
//   ),
// );
//   }
// }
