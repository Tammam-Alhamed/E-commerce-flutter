import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class SortData {
  Crud crud;
  SortData(this.crud);
  getA_to_Z(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.A_to_Z, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }

}
