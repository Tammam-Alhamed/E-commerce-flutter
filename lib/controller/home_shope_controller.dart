import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
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

  int i = 1;


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
  List slides = [];


  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
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
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        shope.addAll(response['shope']['data']);
        items.addAll(response['items']['data']);
        List responsedata = response['slides']['data'];
        image.addAll(responsedata.map((e) => slidesmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

// ----------------------------------------------------------------------------------------------------------------------





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
