import 'package:bazar/core/class/crud.dart';
import 'package:bazar/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid , String itemsqua ,String itemscolor ,String itemssize ) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": usersid, "itemsid": itemsid , "itemsqua" : itemsqua , "itemscolor" : itemscolor, "itemssize" : itemssize});
    return response.fold((l) => l, (r) => r);
  }

  addFromCart(String usersid, String cartid  , String itemsid  ) async {
    var response = await crud
        .postData(AppLink.fromcartadd, {"usersid": usersid, "cartid": cartid  , "itemsid": itemsid  });
    return response.fold((l) => l, (r) => r);
  }
  deleteFromCart(String usersid, String cartid  , String itemsid  ) async {
    var response = await crud
        .postData(AppLink.fromcartdelete, {"usersid": usersid, "cartid": cartid  , "itemsid": itemsid  });
    return response.fold((l) => l, (r) => r);
  }
  // addColor(String usersid, String itemsid ,String color) async {
  //   var response = await crud
  //       .postData(AppLink.cartadd, {"usersid": usersid, "itemsid": itemsid ,"color": color});
  //   return response.fold((l) => l, (r) => r);
  // }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
