import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/data/model/itemsimagesmodel.dart';

import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/items_controller.dart';


class Sliderdetails extends GetView<ProductDetailsControllerImp> {
  @override
  Widget build(BuildContext context) {

    return

            CarouselSlider.builder(
                itemCount:controller.images.length, itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(

                child:TopProductPageDetails(imagesModel: ImagesModel.fromJson(controller.images[index])));

            } ,

                options: CarouselOptions(
                  enlargeStrategy : CenterPageEnlargeStrategy.zoom,
                  height:430,
                  disableCenter: true,
                  clipBehavior: Clip.none,
                  aspectRatio: 16/7,
                  viewportFraction: 1.2,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds:2000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,));





  }

}