import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';

import 'package:bazar/data/model/itemsimagesmodel.dart';

import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazar/data/model/itemsmodel.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  final ImagesModel imagesModel;
  const TopProductPageDetails({Key? key, required this.imagesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            //top: 28.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: Stack(children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          final imageProvider = Image.network(
                                  "${AppLink.imagestItems}/${imagesModel.imagesName!}")
                              .image;

                          showImageViewer(context, imageProvider,
                              immersive: false,
                              closeButtonTooltip: "close",
                              useSafeArea: true
                              );
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestItems}/${imagesModel.imagesName!}",
                          height: 400,
                          width: 500,
                          placeholder: (BuildContext context, String url) =>
                              Container(
                            width: 320,
                            height: 240,
                            decoration: BoxDecoration(
                                color:
                                    AppColor.backgroundcolor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Image.asset(
                              AppImageAsset.logo,
                              width: 100,
                            )),
                          ),
                          fadeInDuration: const Duration(milliseconds: 500),
                          fit: BoxFit.fill,
                        ),
                      )
                    ]))))
      ],
    );
  }
}
