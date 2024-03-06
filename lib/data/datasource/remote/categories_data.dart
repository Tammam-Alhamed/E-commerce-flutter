import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getData(String id , String userid) async {
    var response = await crud.postData(AppLink.categories, {"id" : id , "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }

  getDiscount( String userid) async {
    var response = await crud.postData(AppLink.itemsdiscount, { "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }

  getNew( String userid) async {
    var response = await crud.postData(AppLink.itemsnew, { "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }

  getOffer( String userid) async {
    var response = await crud.postData(AppLink.itemsoffer, { "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }
}
