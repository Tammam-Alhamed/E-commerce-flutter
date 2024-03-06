import 'package:bazar/controller/home_shope_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/core/constant/imgaeasset.dart';
import 'package:bazar/data/model/slidesmodel.dart';
import 'package:bazar/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageSliderScreenTop extends GetView<HomeShopeControllerImp> {
  final List<slidesmodel> slideModel;

  const ImageSliderScreenTop({super.key,  required this.slideModel});
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 160,
          margin: const EdgeInsets.only(top: 20),
          child: Swiper(
            itemCount:3,
            itemBuilder: (BuildContext context,int index){
              return InkWell(
                onTap: (){
                  slideModel[index].slidesImage == slideModel[1].slidesImage ? controller.goToItemsNew(controller.data) : slideModel[index].slidesImage == slideModel[0].slidesImage ? controller.goToItemsDiscount(controller.data) :
                  controller.goToItemsOffer(controller.data);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    placeholder: (BuildContext context, String url) => Container(
                      width: 320,
                      height: 240,
                      decoration: BoxDecoration(
                          color: AppColor.backgroundcolor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child:  Image.asset(AppImageAsset.logo ,width: 100,)),
                    ),
                    fadeInDuration: const Duration(milliseconds: 200),
                    imageUrl : '${AppLink.imagestSlides}/${slideModel[index].slidesImage}',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            outer: false,
            autoplayDisableOnInteraction : false,
            loop: true,
            indicatorLayout : PageIndicatorLayout.SCALE,
            duration: 1500,
            autoplay: false,
            pagination: const SwiperPagination(
             builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.blue,
                    size: 10.0,
                    activeSize: 10.0)),

          )

      );


  }
}