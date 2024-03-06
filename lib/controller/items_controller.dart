import 'package:dartz/dartz.dart';
import 'package:bazar/controller/categories_controller.dart';
import 'package:bazar/controller/home_controller.dart';
import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/core/class/statusrequest.dart';
import 'package:bazar/core/constant/routes.dart';
import 'package:bazar/core/functions/handingdatacontroller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:bazar/data/datasource/remote/categories_data.dart';
import 'package:bazar/data/datasource/remote/items_data.dart';
import 'package:bazar/data/datasource/remote/items_images.dart';
import 'package:bazar/data/datasource/remote/sort_data.dart';
import 'package:bazar/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  // changeCat(int val, String catval);
  getimages(String imageid);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {

  List categories = [];
  String? catid;
  String? imgid;
  String? shopeid;
  String? discount;
  int page = 10 ;


  int? selectedCat;
  ItemsData testData = ItemsData(Get.find());
  ItemsImages dataimage =ItemsImages(Get.find());
  SortData sort = SortData(Get.find());

 // ScrollController  scrollController = ScrollController();
   SingleChildScrollView? child;
  int _totalCount = 0;
  int limit = 20;
  int offset = 0;
  late ScrollController scrollController;
  bool isLoading = true;


  int currentMax = 10;
  List myList = [];
  String? currentTabCat;

  /*void _onScroll() {
    final offset =scrollController.offset;
    final minOffset = scrollController.position.minScrollExtent;
    final maxOffset =scrollController.position.maxScrollExtent;
    final isOutOfRange =scrollController.position.outOfRange;

    final hasReachedTheEnd = offset >= maxOffset && !isOutOfRange;
    final hasReachedTheStart = offset <= minOffset && !isOutOfRange;
    final isScrolling = maxOffset > offset && minOffset < offset;

    // This code doesn't print anything.
    if (isScrolling) {
      print('isScrolling');
    } else if (hasReachedTheStart) {
      print('hasReachedTheStart');
    } else if (hasReachedTheEnd) {
      print('hasReachedTheEnd');
    } else {
      print('IDK');
    }
  }*/



  var character;
  List data = [];
  List image = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
     search = TextEditingController();

    intialData();


    super.onInit();
  }

  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    imgid = Get.arguments['imgid'];



  }

/* void _scrollListener() {

   if (scrollController.position.pixels ==
       scrollController.position.maxScrollExtent) {
     print('Page reached end of page');}

  }*/

 /* addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add( (data));
          print(list.length);
          update();
        }
      }
    });
  }*/


  changeCat( catval) {
    catid = catval;
    getItems(catid! ,  limit, offset);
    update();
  }

  getItems(categoryid , limit, offset) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString("id")! , limit.toString(),offset.toString());
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
    isLoading = false;
    update();
  }


  getimages(String imageid) async {
    image.clear();
    statusRequest = StatusRequest.loading;
    var response = await dataimage.getData(
        imageid);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        image.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  getA_to_Z(categoryid , lang) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await sort.getA_to_Z(
        categoryid, myServices.sharedPreferences.getString("id")! , lang);
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

  getZ_to_A(categoryid , lang) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await sort.getZ_to_A(
        categoryid, myServices.sharedPreferences.getString("id")! , lang);
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


  getLowest_to_Highest(categoryid , lang) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await sort.getLowest_to_Highest(
        categoryid, myServices.sharedPreferences.getString("id")! , lang);
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
  getHighest_to_Lowest(categoryid , lang) async {
    data.clear();

    statusRequest = StatusRequest.loading;
    isLoading = true;
    var response = await sort.getHighest_to_Lowest(
        categoryid, myServices.sharedPreferences.getString("id")! , lang);
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


  goToA_to_Z(lang) {
    character;
    Get.toNamed(AppRoute.items);
    getA_to_Z(catid , lang );
    update();
  }

  goToZ_to_A(lang) {
    character;
    Get.toNamed(AppRoute.items);
    getZ_to_A(catid , lang );
    update();
  }

  goToLowest_to_Highest(lang) {
    character;
    Get.toNamed(AppRoute.items);
    getLowest_to_Highest(catid , lang );
    update();
  }
  goToHighest_to_Lowest(lang) {
    character;
    Get.toNamed(AppRoute.items);
    getHighest_to_Lowest(catid , lang );
    update();
  }
  goToitems() {
    character;
    Get.toNamed(AppRoute.items);
   getItems(catid ,  limit, offset);
    update();
  }

  getMorePage() async{

    scrollController.addListener(() {
      print("object");
      // if(scrollController.position.maxScrollExtent == scrollController.offset){
      //   ++page;
      //   getItems(catid , page);
      // }
      // update();
    });

  }



  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

}