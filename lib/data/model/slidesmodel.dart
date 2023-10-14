 class slidesmodel{
  String? slidesId;
  String? slidesImage;
  String? createdAt;
  String? updatedAt;

  slidesmodel({this.slidesId, this.slidesImage, this.createdAt, this.updatedAt});

  slidesmodel.fromJson(Map<String, dynamic> json) {
    slidesId = json['slides_id'];
    slidesImage = json['slides_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slides_id'] = this.slidesId;
    data['slides_image'] = this.slidesImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}