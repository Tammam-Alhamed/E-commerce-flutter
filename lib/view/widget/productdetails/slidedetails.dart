import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/data/model/itemsimagesmodel.dart';
import 'package:bazar/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


class Sliderdetails extends GetView<ProductDetailsControllerImp> {
  final int itemNum ;

  Sliderdetails({super.key, required this.itemNum});
  Widget build(BuildContext context) {
    return
      Container(
        height: 450,
          child: Swiper(
            itemCount:controller.data[itemNum]['image'].length,
            itemBuilder: (BuildContext context,int index){
              return TopProductPageDetails(
                                imagesModel: ImagesModel.fromJson(controller.data[itemNum]['image'][index]
                                ));
            },
            itemHeight: 400,
            containerHeight: 430,
            containerWidth: 400,
            itemWidth: 400,
            viewportFraction: 1.2,
            outer: false,
            autoplayDisableOnInteraction : false,
            loop: false,
            indicatorLayout : PageIndicatorLayout.SCALE,
            duration: 1500,
            autoplay: false,
            pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: AppColor.sky,
                    activeColor: AppColor.primaryColor,
                    size: 9.0,
                    activeSize: 7.0)),

          ),
        )
        // CarouselSlider.builder(
        //   carouselController: buttonCarouselController,
        //     disableGesture: true,
        //     itemCount:controller.images.length,
        //     itemBuilder: (BuildContext context, int index, int realIndex) {
        //           return TopProductPageDetails(
        //               imagesModel: ImagesModel.fromJson(controller.images[index]
        //               ));
        //         } ,
        //             options: CarouselOptions(
        //               enlargeStrategy : CenterPageEnlargeStrategy.zoom,
        //               height:430,
        //               disableCenter: false,
        //               clipBehavior: Clip.none,
        //               aspectRatio: 16/7,
        //               viewportFraction: 1.2,
        //               initialPage: 0,
        //               enableInfiniteScroll: false,
        //               reverse: false,
        //               autoPlay: true,
        //               autoPlayInterval: Duration(seconds: 5),
        //               autoPlayAnimationDuration: Duration(milliseconds:2000),
        //               autoPlayCurve: Curves.fastOutSlowIn,
        //               enlargeCenterPage: false,
        //               enlargeFactor: 0.5,
        //               // onPageChanged: callbackFunction,
        //               scrollDirection: Axis.horizontal,)),


;






  }

}