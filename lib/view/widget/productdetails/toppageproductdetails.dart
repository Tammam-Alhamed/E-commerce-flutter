import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

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
                    Image.network("${AppLink.imagestItems}/${controller.itemsModel.itemsImage!}").image;
                showImageViewer(context, imageProvider,
                    onViewerDismissed: () {
                      print("dismissed");
                    });
              },
              child: Hero(
                tag: "${controller.itemsModel.itemsId}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imagestItems}/${controller.itemsModel.itemsImage!}",
                  height: 200,

                  fit: BoxFit.fill,
                ),
              ),
            )])))
        )  ],
    );
  }
}
