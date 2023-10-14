class shopesmodel {
  String? shopesId;
  String? shopesName;
  String? shopesNameAr;
  String? shopesNameRu;
  String? shopesImage;
  String? shopesDatetime;

  shopesmodel({this.shopesId,
    this.shopesName,
    this.shopesNameAr,
    this.shopesNameRu,
    this.shopesImage,
    this.shopesDatetime});

  shopesmodel.fromJson(Map<String, dynamic> json) {
    shopesId = json['shopes_id'];
    shopesName = json['shopes_name'];
    shopesNameAr = json['shopes_name_ar'];
    shopesNameRu = json['shopes_name_ru'];
    shopesImage = json['shopes_image'];
    shopesDatetime = json['shopes_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopes_id'] = this.shopesId;
    data['shopes_name'] = this.shopesName;
    data['shopes_name_ar'] = this.shopesNameAr;
    data['shopes_name_ru'] = this.shopesNameRu;
    data['shopes_image'] = this.shopesImage;
    data['shopes_datetime'] = this.shopesDatetime;
    return data;
  }
}