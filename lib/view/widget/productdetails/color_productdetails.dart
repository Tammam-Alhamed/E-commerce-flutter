
import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/data/model/itemscolorsmodel.dart';
import 'package:bazar/view/screen/categories_shope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'listcolor.dart';

class CustomColor extends  GetView<ProductDetailsControllerImp>{
  const CustomColor({super.key});

  @override

  Widget build(BuildContext context) {
    return CircleColorRow(colors: [],);
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
  ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());

  Widget build(BuildContext context) {
    var i;
    controller.colors.length == 1 ? i = "0" : i;
    return Scrollbar(
        thumbVisibility:true,
        interactive:true,

        trackVisibility:true,
        controller: _firstController,
        child: SingleChildScrollView(
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _firstController,
          scrollDirection: Axis.horizontal,
          child: Row(
          children: List.generate(
            controller.colors.length == 1 ? 0 : controller.colors.length,
                (index) {
              if(controller.colors[index]['colors_name'] !="0" ){
              return InkWell(
                onTap: () {
                  setState(() {
                    controller.currentTabColor = index;
                    i=controller.colors[index]['colors_name'] ;
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
                    borderRadius: BorderRadius.circular(5),
                    border: controller.colors.length == 1 ?null :controller.currentTabColor == index
                        ? Border.all(color: AppColor.thirdColor, width: 1.5)
                        : null,
                  ),
                  child: Listcolors(colorsModel: ColorsModel.fromJson(controller.colors[index]),),
                ),
              );
              }else{
                return SizedBox();
              }
            },

          ),
        ),
   ),
      );
 }
}