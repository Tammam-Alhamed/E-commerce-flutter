import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id , String userid ,String limit,String offset ) async {
    var response = await crud.postData(AppLink.items, {"id" : id.toString() , "usersid" : userid , "limit" : limit,"offset":offset });
    return response.fold((l) => l, (r) => r);
  }

  getDataImages( String itemsid) async {
    var response = await crud.postData(AppLink.itemsImages, { "itemsid" : itemsid});
    return response.fold((l) => l, (r) => r);
  }





}
