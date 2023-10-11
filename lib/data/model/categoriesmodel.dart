class CategoriesModel {
  String? categoriesId;
  String? categoriesshope;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesNamaRu;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesshope,
      this.categoriesName,
      this.categoriesNamaAr,
      this.categoriesNamaRu,
      this.categoriesImage,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesshope = json['categories_shope'];
    categoriesName = json['categories_name'];
    categoriesNamaAr = json['categories_name_ar'];
    categoriesNamaRu = json['categories_name_ru'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_shope'] = this.categoriesshope;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNamaAr;
    data['categories_name_ru'] = this.categoriesNamaRu;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
