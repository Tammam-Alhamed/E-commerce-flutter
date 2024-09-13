import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/bindings/intialbindings.dart';
import 'package:bazar/core/localization/translation.dart';
import 'package:bazar/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';


@pragma('vm:entry-point')
Future background(RemoteMessage message) async{
  await initialServices();
  MyServices myServices = Get.put(MyServices());
  var unreadCount = myServices.sharedPreferences.getInt('unreadCount') ?? 0;
  await myServices.sharedPreferences.setInt('unreadCount', unreadCount);
  await myServices.sharedPreferences.reload();
}
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  LocaleController controller = Get.put(LocaleController());

  FirebaseMessaging.onBackgroundMessage(background);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

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

