import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email ,String verifycode , String code) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email" : email , 
      "verifycode" : verifycode,
      "code" : code
    });
    return response.fold((l) => l, (r) => r);
  }
}
