import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password  ,String phone , String code ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username , 
      "password" : password  , 
      "code" : code ,
      "phone" : phone  , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
