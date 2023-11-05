import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';

import 'package:ecommercecourse/data/model/itemsimagesmodel.dart';

import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {

  final ImagesModel imagesModel;
  const TopProductPageDetails({Key? key, required this.imagesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
          height: 200,
          width: 300,
          decoration:  BoxDecoration(//color: AppColor.grey,
              borderRadius: BorderRadius.circular(40),
             boxShadow: [
              BoxShadow(
              color: AppColor.primaryColor.withOpacity(0.3),
        spreadRadius: 3,
        blurRadius: 5,
        offset: Offset(0, 8), // changes position of shadow
      ),
      ],
          ),
        ),
        Positioned(
            top: 28.0,
            right: Get.width / 8,
            left: Get.width /8,
            child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(40.0)),
    child: Stack(children: <Widget>[InkResponse(
              onTap: () async {
                final imageProvider =

                    Image.network("${AppLink.imagestItems}/${imagesModel.imagesName!}").image;

                showImageViewer(context, imageProvider,);
              },


                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imagestItems}/${imagesModel.imagesName!}",
                  height: 200,

                  fit: BoxFit.fill,
                ),

            )])))
        )  ],
    );
  }
}
