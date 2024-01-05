class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsNameRu;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsDescRu;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsPriceD;
  String? itemsDiscount;
  String? itemsPriceDiscountD;
  String? itemsDate;
  String? itemsCat;
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
        this.itemsNameRu,
        this.itemsDesc,
      this.itemsDescAr,
      this.itemsDescRu,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsPriceD,
      this.itemsDiscount,
        this.itemsPriceDiscountD,
      this.itemsDate,
      this.itemsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsNameRu = json['items_name_ru'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescRu = json['items_desc_ru'];
    itemsImage = json['items_image_main'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsPriceD = json['items_price_d'];
    itemsDiscount = json['items_discount'];
    itemsPriceDiscountD= json['itemspricediscount_d'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_name_ru'] = this.itemsNameRu;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_desc_ru'] = this.itemsDescRu;
    data['items_image_main'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_price_d'] = this.itemsPriceD;
    data['items_discount'] = this.itemsDiscount;
    data['itemspricediscount_d'] = this.itemsPriceDiscountD;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}