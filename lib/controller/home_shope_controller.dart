import 'package:bazar/controller/homescreen_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/home_data.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:bazar/data/model/slidesmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/categories_data.dart';

abstract class HomeShopeController extends SearchMixController {
  initialData();
  getdata();

  goToItems( List shopes, int selectedShope ,String shopeid );
}

class HomeShopeControllerImp extends HomeShopeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  String? currentTabShope;
  double? pageCard = 3;
  String? discount;
  int i = 1;

  RxInt unreadNotificationCount = 0.obs;
  incrementUnreadNotificationCount() {
    unreadNotificationCount.value++;
    update();// Increment the count by 1
  }
  void configureFirebaseMessaging() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission to receive notifications
    await messaging.requestPermission();

    // Configure Firebase Messaging listeners
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      incrementUnreadNotificationCount();
      update();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification when app is in the foreground
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    incrementUnreadNotificationCount();
  }


  HomeData homedata = HomeData(Get.find());


  CategoriesData testData = CategoriesData(Get.find());
 List dat =[];
  List<slidesmodel> image = [];

  List NEW = [] ;
  List offer = [] ;

  late StatusRequest statusRequest;


  List data = [];
  // List data = [];
  List shope = [];
  List items = [];
  List itemsNew =[] ;
  List slides = [];
  List users = [];


  @override
  initialData() {
    print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
    print(unreadNotificationCount);
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");

  }

  @override
  void onInit() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Get.toNamed(AppRoute.homepage);
    });
    configureFirebaseMessaging();
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    data.clear();
    shope.clear();
    items.clear();
    image.clear();
    users.clear();
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData(myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        users.addAll(response['users']['data']);
        shope.addAll(response['shope']['data']);
        items.addAll(response['items']['data']);
        itemsNew.addAll(response['itemsNew']['data']);
        List responsedata = response['slides']['data'];
        image.addAll(responsedata.map((e) => slidesmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





  @override
  goToItems( shopes, selectedShope , shopeid) {
    Get.toNamed(AppRoute.categories, arguments: {
      "shopes": shopes,
      "selectedshope": selectedShope,
      "shopeid": shopeid,
    });
  }


  goToItemsNew(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getNew();
  }


  goToItemsDiscount(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getItems();
  }

  goToItemsOffer(categories ) {
    Get.toNamed(AppRoute.itemsDiscount);
    getOffer();
  }


  getOffer() async {
    data.clear();
    offer.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getOffer(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
        offer.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  getNew() async {
    data.clear();
    NEW.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getNew(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
        NEW.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getDiscount(
        myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  reff(){
    searchData();
    getItems();
    getOffer();
    getdata();
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    listdata.clear();
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }


  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }



}
