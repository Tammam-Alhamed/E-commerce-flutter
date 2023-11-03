import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/item_imagsmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
class TopProductPageDetails extends GetView<ItemsControllerImp> {
  final ImagesModel imagesModel;
  const TopProductPageDetails({Key? key, required this.imagesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
      Container(
          height: 150,
          decoration:  BoxDecoration(//color: AppColor.grey,
              borderRadius: BorderRadius.circular(40),
             boxShadow: [
              BoxShadow(
              color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
      ],
          ),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width /8,
            child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    child: Stack(children: <Widget>[InkResponse(
              onTap: () async {
                final imageProvider =
                    Image.network("${AppLink.imagestItems}/${imagesModel.imagesName}").image;
                showImageViewer(context, imageProvider,
                    onViewerDismissed: () {
                      print("dismissed");
                    });
              },
              child: Hero(
                tag: "${imagesModel.imagesItems}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imagestItems}/${imagesModel.imagesName!}",
                  height: 200,

                  fit: BoxFit.fill,
                ),
              ),
            )])))
        )  ],
    );
  }
}
