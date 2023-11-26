import 'package:card_swiper/card_swiper.dart';
import 'package:ecommercecourse/controller/slides_controller.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageSliderScreen extends GetView<SlidesControllerImp> {
  //final ItemsModel itemsModel;

  const ImageSliderScreen( {Key? key} ) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)),
      child: Swiper.children(
        outer : true,
        loop: true,
         indicatorLayout : PageIndicatorLayout.SCALE,
        scale: 1.3,
        duration: 1500,
        autoplay: true,
        pagination: const SwiperPagination(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.blue,
                size: 10.0,
                activeSize: 10.0)),
        children: <Widget>[
          InkWell(
            onTap: (){
              controller.goToItemsNew(controller.data);
            },
            child: Image.asset(
              AppImageAsset.deliveryImage,
              fit: BoxFit.contain,
            ),
          ),
          InkWell(
            onTap: (){
              controller.goToItemsDiscount(controller.data);
            },
            child: Image.asset(
              AppImageAsset.deliveryImage2,
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(
              AppImageAsset.drivethruImage,
              fit: BoxFit.contain)
        ],
      )
    );


  }


}