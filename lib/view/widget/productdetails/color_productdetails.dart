
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
print(controller.colors.length);
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

  ProductDetailsControllerImp controller=Get.put(ProductDetailsControllerImp());
  int currentTab = 0;
  String? sid;
  Widget build(BuildContext context) {

    return
  /*  DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      isExpanded: true,
        borderRadius:BorderRadius.circular(20),
      padding:EdgeInsets.only(right:0),
    hint: Text("Select Stockiest",
    style: TextStyle(fontSize : 10,color: Colors.black)),
      value:sid,
    items: controller.colors
        .map((list) {
    return DropdownMenuItem(

    child: Container(width:50, height:20,child: Text(list['colors_name'])),
    value: list['colors_name'].toString(),
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
      print("lgkbkrhturng");
    sid = value!;
    });
    },
    ),
    );*/


      Scrollbar(
        thumbVisibility:true,
          interactive:true,
        radius:Radius.circular(50),
        trackVisibility:true,
        child: SingleChildScrollView(
    
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          controller:ScrollController(keepScrollOffset: true),
          scrollDirection: Axis.horizontal,
     child: Row(
          children: List.generate(

            controller.colors.length,
                (index) {

              return InkWell(
                onTap: () {

                  setState(() {
                    currentTab = index;
                    // var i=controller.colors[index]['colors_id'];
                    // controller.color(i);
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
                    border: currentTab == index
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