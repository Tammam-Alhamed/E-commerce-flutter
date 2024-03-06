import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class ItemsImages{
  Crud crud;
  ItemsImages(this.crud);
  getData( String userid) async {
    var response = await crud.postData(AppLink.itemsImages, { "usersid" : userid});
    return response.fold((l) => l, (r) => r);
  }
}
