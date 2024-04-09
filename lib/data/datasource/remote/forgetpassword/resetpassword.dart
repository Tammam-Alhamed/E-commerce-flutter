import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email ,String password , String code) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email" : email , 
      "password" : password,
      "code" : code
    });
    return response.fold((l) => l, (r) => r);
  }
}
