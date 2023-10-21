import 'dart:convert';

import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widget/home/listitemshome.dart';
import 'package:ecommercecourse/view/widget/home/slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ImageSliderScreen extends GetView<HomeShopeControllerImp> {
  //final ItemsModel itemsModel;

  const ImageSliderScreen( {Key? key} ) : super(key: key);
  Widget build(BuildContext context) {
    int index =0;

    var myitems =[ ListView.builder(
        itemCount: controller.slides.length,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return  Home(
              slidesModel: slidesmodel.fromJson(controller.slides[i]));})];




    return Container(
        height: 200,
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20)),
        child: Column(

          children: [
            CarouselSlider.builder(itemCount:controller.slides.length, itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                //  decoration: BoxDecoration(
                // color: AppColor.black.withOpacity(0.3),
                //  borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  width: 280,
                  child: Home(
                      slidesModel: slidesmodel.fromJson(controller.slides[index])));
            } ,

                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,

                    autoPlayAnimationDuration: const Duration(milliseconds: 300)))

            ,// items: myitems.map((my) => (myitems:myitems)),)
          ],
        )

    );


  }


}





