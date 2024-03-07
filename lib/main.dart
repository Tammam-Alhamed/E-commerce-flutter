import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/bindings/intialbindings.dart';
import 'package:bazar/core/localization/translation.dart';
import 'package:bazar/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';


HomeScreenControllerImp controllerImp= Get.put(HomeScreenControllerImp());
int i = 0 ;
Future background(RemoteMessage message) async{
  controllerImp.count(i++) ;
  controllerImp.count_notification = i ;
  print(i);
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    FirebaseMessaging.onBackgroundMessage(background);
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Базар',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}

