import 'package:bazar/controller/settings_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/view/widget/language/custombuttomlang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widget/setting/about_us.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      body: Padding(
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
            SettingsList(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              applicationType: ApplicationType.both,
              lightTheme: SettingsThemeData(settingsListBackground: Colors.white),
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile(
                      onPressed: (BuildContext context) {
                        Get.toNamed(AppRoute.orderspending);
                      },
                      leading: Container(
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(Iconsax.document_upload_bold,color: AppColor.secondColor, )),
                      title: Text("54".tr),
                    ),
                    // iconStyle: IconStyle(backgroundColor: AppColor.primaryColor),
                    SettingsTile(
                      onPressed: (BuildContext context) {
                        Get.toNamed(AppRoute.addressview);
                      },
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Color(0xf00748d2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(CupertinoIcons.archivebox_fill,color: AppColor.secondColor,)),
                      // iconStyle: IconStyle(
                      //   backgroundColor: Color(0xda0748d2)
                      // ),
                      title: Text("Address",),
                    ),
                    SettingsTile(
                      onPressed: (BuildContext context) {
                        Get.toNamed(AppRoute.ordersarchive);
                      },
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Color(0xda0748d2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(CupertinoIcons.archivebox_fill,color: AppColor.secondColor,)),
                      // iconStyle: IconStyle(
                      //   backgroundColor: Color(0xda0748d2)
                      // ),
                      title: Text("55".tr,),
                    ),
                    SettingsTile(
                      onPressed: (BuildContext context) {
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
                                        )));
                          },
                        );
                      },
                      leading: Container(
                          decoration: BoxDecoration(
                            color: AppColor.thirdColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.gavel_sharp,color: AppColor.secondColor,)),
            /*                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: AppColor.thirdColor,
                ),*/
                      title: Text("57".tr),
                    ),

                    SettingsTile(
                      onPressed: (BuildContext context) {
                        Get.bottomSheet(About_us());
                      },
                      leading: Container(
                          decoration: BoxDecoration(
                            color: AppColor.home,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.info_rounded,color: AppColor.secondColor,)),
                      // iconStyle: IconStyle(
                      //   backgroundColor: AppColor.home
                      // ),
                      title: Text("56".tr,style: TextStyle(color: AppColor.home),),
                    ),
                  ],
                ),



                SettingsSection(
                  title: Text("134".tr,style: TextStyle(color: AppColor.grey,fontSize: 25, fontWeight: FontWeight.bold),),
                  tiles: [
                    SettingsTile(
                      onPressed: (BuildContext context) {
                        controller.logout();
                      },
                      leading:Icon(Icons.exit_to_app_rounded,color: Colors.red,) ,
                      title: Text("58".tr,style: TextStyle(color: Colors.red),),
                    ),

                    SettingsTile(
                      onPressed: (BuildContext context) {
                        Get.bottomSheet(Container(
                          height: 300,
                          color: AppColor.backgroundcolor,
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("1".tr,
                                      style: Theme.of(context).textTheme.displayLarge),
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
                      leading: Icon(Icons.language),
                      title: Text("133".tr),
                    )

                  ],)
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
