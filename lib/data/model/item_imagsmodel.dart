class ImagesModel {
  String? imagesId;
  String? imagesName;
  String? imagesItems;

  ImagesModel(
      {this.imagesId,
        this.imagesName,
        this.imagesItems,});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    imagesId = json['images_id'];
    imagesName = json['images_name'];
    imagesItems = json['images_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images_id'] = this.imagesId;
    data['images_name'] = this.imagesName;
    data['images_items'] = this.imagesItems;
    return data;
  }
}