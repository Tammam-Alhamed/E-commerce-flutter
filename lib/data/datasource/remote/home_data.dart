import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.homepage, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
