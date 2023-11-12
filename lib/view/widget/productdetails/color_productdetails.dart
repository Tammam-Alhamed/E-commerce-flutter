
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

  Widget build(BuildContext context) {

    return
  /*  DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      isExpanded: true,
      padding:EdgeInsets.only(right:0),
<<<<<<< HEAD
    hint: Text("select color",
    style: TextStyle(color: Colors.black)),
      value: controller.sid,
=======
    hint: Text("Select Stockiest",
    style: TextStyle(fontSize : 10,color: Colors.black)),
      value:sid,
>>>>>>> f6b259792258ae60d4365a43e5f075e2f78868c7
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
    controller.sid = value!;
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
          controller: ScrollController( ),
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.horizontal,
          child: Row(
          children: List.generate(

            controller.colors.length,
                (index) {

              return InkWell(
                onTap: () {

                  setState(() {
                    controller.currentTab = index;
                    var i=controller.colors[index]['colors_name'];
                    controller.color(i);
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
                    border: controller.currentTab == index
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