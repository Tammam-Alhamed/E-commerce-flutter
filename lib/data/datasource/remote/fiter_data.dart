import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class FilterData {
  Crud crud;
  FilterData(this.crud);
  filter_get(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.filter_get, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }

  filter_request(String id , String userid , String lang , data) async {
    var response = await crud.postData(AppLink.filter_get, {"id" : id.toString() , "usersid" : userid , "lang" : lang , "data" : data});
    return response.fold((l) => l, (r) => r);
  }
}
