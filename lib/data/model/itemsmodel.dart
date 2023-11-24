class ItemsModel {
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
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesNamaRu;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsPriceDiscount ;
  String? itemspricedisount_d ;
  String? itemsStatus ;

  ItemsModel(
      {this.itemsId,
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
      this.itemsDate,
      this.itemsCat,
        this.itemsStatus,
      this.itemsPriceDiscount , 
      this.itemspricedisount_d ,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNamaAr,
        this.categoriesNamaRu,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsStatus = json['items_status'];
    itemsPriceDiscount = json['itemspricedisount'];
    itemspricedisount_d = json['itemspricedisount_d'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNamaAr = json['categories_name_ar'];
    categoriesNamaRu = json['categories_name_ru'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['items_status'] = this.itemsStatus;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNamaAr;
    data['categories_name_ru'] = this.categoriesNamaRu;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
