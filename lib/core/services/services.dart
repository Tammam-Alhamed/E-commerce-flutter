import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    if(kIsWeb){
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyARkFI3CoE9U_Kuq5ublutMtDgFyW1dsQ8",
              authDomain: "xn----7sbababd9be0gf.com",
              projectId: "al3ashra-3c5a3",
              storageBucket: "al3ashra-3c5a3.appspot.com",
              messagingSenderId: "235768477147",
              appId: "1:235768477147:web:7e9a17a0ededa691eca3fe",
              measurementId: "G-F2023WWES4")
      );
      sharedPreferences = await SharedPreferences.getInstance();
      return this;
    }else {
      await Firebase.initializeApp();
      sharedPreferences = await SharedPreferences.getInstance();
      return this;
    }
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
