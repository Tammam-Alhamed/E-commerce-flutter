import 'package:bazar/controller/home_shope_controller.dart';
import 'package:bazar/view/Support/Images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/data/model/slidesmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageSliderScreenMiddle extends GetView<HomeShopeControllerImp> {
  final List<slidesmodel> slideModel;

  const ImageSliderScreenMiddle({super.key,  required this.slideModel});
  @override
  Widget build(BuildContext context) {

    return Container(
        height: 250,
        margin: const EdgeInsets.only(top: 20),
        child: Swiper(
          itemWidth: 350,
          layout: SwiperLayout.STACK,
          itemCount:3,
          itemBuilder: (BuildContext context,int index){
            return  ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Images(
                  width: 320,
                  height: 240,
                  url: index == 1?'${AppLink.imagestSlides}/${slideModel[3].slidesImage}':index==2?'${AppLink.imagestSlides}/${slideModel[4].slidesImage}':'${AppLink.imagestSlides}/${slideModel[5].slidesImage}',
                  raduis: 0,),
              );
          },
          outer: true,
          autoplayDelay: kDefaultAutoplayDelayMs,
          autoplayDisableOnInteraction : true,
          loop: true,
          indicatorLayout : PageIndicatorLayout.SCALE,
          duration: 1500,
          autoplay: true,
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  activeColor: AppColor.primaryColor,
                  color: AppColor.thirdColor,
                  size: 10.0,
                  activeSize: 10.0)),

        )

    );


  }
}