class ColorsModel {
  String? colorsId;
  String? colorsName;
  String? colorsItems;

 ColorsModel(
      {this.colorsId,
        this.colorsName,
        this.colorsItems,});

  ColorsModel.fromJson(Map<String, dynamic> json) {
    colorsId = json['colors_id'];
    colorsName = json['colors_name'];
    colorsItems = json['colors_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colors_id'] = this.colorsId;
    data['colors_name'] = this.colorsName;
    data['colors_items'] = this.colorsItems;
    return data;
  }
}