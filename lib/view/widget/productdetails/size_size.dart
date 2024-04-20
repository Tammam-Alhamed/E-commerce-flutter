import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/data/model/itemssizesmodel.dart';
import 'package:bazar/view/widget/productdetails/listsizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Customsize extends  GetView<ItemsControllerImp>{
  const Customsize({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeSelector(
      sizes: [

      ],
    );
  }
}





class SizeSelector extends StatefulWidget {
  const SizeSelector({
    super.key,
    required this.sizes,
  });
  final List<String> sizes;
  @override
  sizeRowState createState() => sizeRowState();
}

class sizeRowState extends State<SizeSelector> {
  ProductDetailsControllerImp controller=Get.put(ProductDetailsControllerImp());
  String? sid;
  @override
  Widget build(BuildContext context) {

    if(controller.sizes.length != 1) {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          borderRadius:BorderRadius.circular(20),
          padding:EdgeInsets.only(right:0),
          value: controller.currentTabSize,
          items: controller.sizes
              .map((list) {
                if(list['sizes_name'] != "0"){return DropdownMenuItem(
                  child: Container(
                      width: 50,
                      height: 20,
                      child: Text(
                         list['sizes_name'])),
                  value: list['sizes_name'].toString(),
                );
                }
                else{
                  return DropdownMenuItem(
                  child: Container(child: Text("select size"),),
                );}

          }).toList(),
          onChanged: (value) {
            setState(() {

               controller.currentTabSize = value;
              print(value);
              print("size");
            });
          },
        ),
      );
    }else{
      return SizedBox();
    }

    /*Row(
      children: List.generate(
        controller.sizes.length,
            (index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentTab = index;
              });
            },
            child: Container(

              alignment:Alignment.center,
              padding: const EdgeInsets.all(2.0),
              width:40,
              height: 40,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(

                    color: currentTab == index
                        ? AppColor.primaryColor
                        : Colors.white,
                    border: Border.all(color: AppColor.fourthColor),
                    borderRadius: BorderRadius.circular(10)),

                // borderRadius: BorderRadius.circular(5),
                // shape: BoxShape.rectangle,
                // border: currentTab == index
                //     ? Border.all(color: AppColor.thirdColor, width: 1.5)
                //     : Border(),

              child: Listsizes(sizesModel: SizesModel.fromJson(controller.sizes[index]),)
            ),
          );
        },
      ),
    );*/
  }
}

