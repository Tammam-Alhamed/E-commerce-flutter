import 'package:bazar/controller/home_shope_controller.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';




class MyCustomWidget extends GetView<HomeShopeControllerImp> {

  MyCustomWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return CardSlide();
  }
}

class CardSlide extends GetView<HomeShopeControllerImp>{
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    double width = MediaQuery.of(context).size.width;
    controller.pageController.addListener(
          () {
        controller.slideCard(controller.pageController.page);
      },
    );

    return Stack(
      children: [
        SizedBox(
          height: width,
          width: width * .95,
          child: LayoutBuilder(
            builder: (context, boxConstraints) {
              for (int i = 0; i <= 3; i++) {
                double currentPageValue = i - controller.pageCard!;
                bool pageLocation = currentPageValue > 0;
                double start = 10 +
                    max(
                        (boxConstraints.maxWidth - width * .75) -
                            ((boxConstraints.maxWidth - width * .75) / 2) *
                                -currentPageValue *
                                (pageLocation ? 10 : 1),
                        0.0);

                var customizableCard = Positioned.directional(
                  top: 40 + 40 * max(-currentPageValue, 0.0),
                  bottom: 40 + 40 * max(-currentPageValue, 0.0),
                  start: start,
                  textDirection: TextDirection.ltr,
                  child: Container(
                      height: width * .67,
                      width: width * .70,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 10)
                          ])),
                );
                cards.add(customizableCard);
              }
              return Stack(children: cards);
            },
          ),
        ),
        Positioned.fill(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            controller: controller.pageController,
            itemBuilder: (context, index) {
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }

}
