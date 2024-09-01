import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email , String code) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email" : email,
      "code" : code
    });
    return response.fold((l) => l, (r) => r);
  }
}
