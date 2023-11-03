

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/items_controller.dart';


class Sliderdetails extends GetView<ItemsControllerImp> {
  @override
  Widget build(BuildContext context) {

    return Container(
        height: 250,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(40)),
        child: Column(

          children: [
            CarouselSlider.builder(itemCount:controller.data.length, itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(

                child:TopProductPageDetails(itemsModel: ItemsModel.fromJson(controller.data[index])
              ));
            } ,

                options: CarouselOptions(
                  /*  autoPlay: true,
                    height: 200,

                    autoPlayAnimationDuration: const Duration(milliseconds: 300)))*/

                  height:250,
                  disableCenter: true,
                  clipBehavior: Clip.hardEdge,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,)

            ) // items: myitems.map((my) => (myitems:myitems)),)
          ],
        )

    );





  }

}