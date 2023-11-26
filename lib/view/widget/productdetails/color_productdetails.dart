
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemscolorsmodel.dart';
import 'package:ecommercecourse/view/screen/categories_shope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'listcolor.dart';

class CustomColor extends  GetView<ProductDetailsControllerImp>{
  const CustomColor({super.key});

  @override

  Widget build(BuildContext context) {
    return CircleColorRow(colors: [],


    );
  }
}

class CircleColorRow extends StatefulWidget {
  const CircleColorRow({
    super.key,
    required this.colors,
  });
  final List<Color> colors;
  @override
  State<CircleColorRow> createState() => _CircleColorRowState();

}

class _CircleColorRowState extends State<CircleColorRow> {

  final ScrollController _firstController = ScrollController();
  ProductDetailsControllerImp controller=Get.put(ProductDetailsControllerImp());

  Widget build(BuildContext context) {

    return Scrollbar(
        thumbVisibility:true,
          interactive:true,
        radius:Radius.circular(50),
        trackVisibility:true,
        controller: _firstController,
        child: SingleChildScrollView(
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _firstController,
          scrollDirection: Axis.horizontal,
          child: Row(
          children: List.generate(
            controller.colors.length,
                (index) {

              return InkWell(
                onTap: () {
                  setState(() {
                    controller.currentTabColor = index;
                    var i=controller.colors[index]['colors_name'];
                    controller.color(i);
                    print(i);
                  });
                },
                child: Container(
                    alignment:Alignment.center,
                  padding: const EdgeInsets.all(2.0),
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: controller.currentTabColor == index
                        ? Border.all(color: AppColor.thirdColor, width: 1.5)
                        : null,
                  ),
child: Listcolors(colorsModel: ColorsModel.fromJson(controller.colors[index]),),
                ),
              );
            },
          ),
        ),
   ),
      );
 }
}