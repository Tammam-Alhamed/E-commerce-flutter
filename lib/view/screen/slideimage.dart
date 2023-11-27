import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommercecourse/controller/slides_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageSliderScreen extends GetView<SlidesControllerImp> {
  final List<slidesmodel> slideModel;

  const ImageSliderScreen({Key? key,  required this.slideModel}) : super(key: key);
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest: controller.statusRequest,
      widget: Container(
          height: 160,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)),
        child: Swiper.children(
          outer: false,
          autoplayDisableOnInteraction : false,
          loop: true,
           indicatorLayout : PageIndicatorLayout.SCALE,
          duration: 1500,
          autoplay: false,
          pagination: const SwiperPagination(

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
                child: CachedNetworkImage(
                  imageUrl :'${AppLink.imagestSlides}/${slideModel[2].slidesImage}',
                  fit: BoxFit.cover,
                ),
              ),

            InkWell(
              onTap: (){
                controller.goToItemsDiscount(controller.data);
              },
              child: CachedNetworkImage(
                imageUrl : '${AppLink.imagestSlides}/${slideModel[1].slidesImage}',
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: (){
                controller.goToItemsOffer(controller.data);
                print(slideModel[1].slidesImage);
              },
              child: CachedNetworkImage(
                  imageUrl :'${AppLink.imagestSlides}/${slideModel[0].slidesImage}',
                  fit: BoxFit.cover),
            )
          ],
        )
      ),
    );


  }


}