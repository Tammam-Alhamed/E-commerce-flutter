import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class SortData {
  Crud crud;
  SortData(this.crud);
  getA_to_Z(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.A_to_Z, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }
  getZ_to_A(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.Z_to_A, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }
  getLowest_to_Highest(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.Lowest_to_Highest, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }
  getHighest_to_Lowest(String id , String userid , String lang) async {
    var response = await crud.postData(AppLink.Highest_to_Lowest, {"id" : id.toString() , "usersid" : userid , "lang" : lang});
    return response.fold((l) => l, (r) => r);
  }

}
