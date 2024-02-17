import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id , String userid , String page) async {
    var response = await crud.postData(AppLink.items, {"id" : id.toString() , "usersid" : userid , "page" : page});
    return response.fold((l) => l, (r) => r);
  }

  getDataImages( String itemsid) async {
    var response = await crud.postData(AppLink.itemsImages, { "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }





}
