import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemssizesmodel.dart';
import 'package:ecommercecourse/view/widget/productdetails/listsizes.dart';
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
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {

    return Row(
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
    );
  }
}

