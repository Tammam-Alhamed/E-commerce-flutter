class SizesModel {
  String? sizesId;
  String? sizesName;
  String? sizesItems;

  SizesModel(
      {this.sizesId,
        this.sizesName,
        this.sizesItems,});

  SizesModel.fromJson(Map<String, dynamic> json) {
    sizesId = json['sizes_id'];
    sizesName = json['sizes_name'];
    sizesItems = json['sizes_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizes_id'] = this.sizesId;
    data['sizes_name'] = this.sizesName;
    data['sizes_items'] = this.sizesItems;
    return data;
  }
}