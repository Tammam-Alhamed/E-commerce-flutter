import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String usersid , String limit) async {
    var response = await crud.postData(AppLink.homepage, {"usersid": usersid ,"limit" : limit });
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
