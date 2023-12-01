import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommercecourse/controller/slides_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/data/model/slidesmodel.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_shope_controller.dart';


class ImageSliderScreen extends GetView<HomeShopeControllerImp> {
  final List<slidesmodel> slideModel;

  const ImageSliderScreen({Key? key,  required this.slideModel}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
          height: 160,
          margin: const EdgeInsets.only(top: 20),

          // Swiper(
          //   itemBuilder: (BuildContext context,int index){
          //     return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,);
          //   },
          //   itemCount: 3,
          //   pagination: SwiperPagination(),
          //   control: SwiperControl(),
          // ),

          child: Swiper(
            itemCount:controller.image.length,
            itemBuilder: (BuildContext context,int index){
              return InkWell(
                onTap: (){
                  print("asdasdad");
                  print(slideModel[0].slidesImage );
                  slideModel[index].slidesImage == slideModel[1].slidesImage ? controller.goToItemsNew(controller.data) : slideModel[index].slidesImage == slideModel[0].slidesImage ? controller.goToItemsDiscount(controller.data) :
                  controller.goToItemsOffer(controller.data);
                },
                child: CachedNetworkImage(
                  imageUrl : '${AppLink.imagestSlides}/${slideModel[index].slidesImage}',
                  fit: BoxFit.cover,
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

            // children: <Widget>[
            //
            //      InkWell(
            //       onTap: (){
            //         controller.goToItemsNew(controller.data);
            //       },
            //         child: CachedNetworkImage(
            //           imageUrl : slideModel[2].slidesImage == List.empty()  ? AppImageAsset.loading : '${AppLink.imagestSlides}/${slideModel[2].slidesImage}',
            //           fit: BoxFit.cover,
            //         ),
            //     ),
            //
            //   InkWell(
            //     onTap: (){
            //       controller.goToItemsDiscount(controller.data);
            //     },
            //
            //     child: CachedNetworkImage(
            //       imageUrl : '${AppLink.imagestSlides}/${slideModel[1].slidesImage}',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   InkWell(
            //     onTap: (){
            //       controller.goToItemsOffer(controller.data);
            //       print(slideModel[1].slidesImage);
            //     },
            //     child: CachedNetworkImage(
            //         imageUrl :'${AppLink.imagestSlides}/${slideModel[0].slidesImage}',
            //         fit: BoxFit.cover),
            //   )
            // ],
          )


          // children: <Widget>[
          //
          //      InkWell(
          //       onTap: (){
          //         controller.goToItemsNew(controller.data);
          //       },
          //         child: CachedNetworkImage(
          //           imageUrl : slideModel[2].slidesImage == List.empty()  ? AppImageAsset.loading : '${AppLink.imagestSlides}/${slideModel[2].slidesImage}',
          //           fit: BoxFit.cover,
          //         ),
          //     ),
          //
          //   InkWell(
          //     onTap: (){
          //       controller.goToItemsDiscount(controller.data);
          //     },
          //
          //     child: CachedNetworkImage(
          //       imageUrl : '${AppLink.imagestSlides}/${slideModel[1].slidesImage}',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   InkWell(
          //     onTap: (){
          //       controller.goToItemsOffer(controller.data);
          //       print(slideModel[1].slidesImage);
          //     },
          //     child: CachedNetworkImage(
          //         imageUrl :'${AppLink.imagestSlides}/${slideModel[0].slidesImage}',
          //         fit: BoxFit.cover),
          //   )
          // ],


      );


  }


}