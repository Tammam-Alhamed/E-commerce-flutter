import 'package:bazar/controller/categories_controller.dart';
import 'package:bazar/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListCat extends GetView<ItemsControllerImp> {

  final void Function(String?)? onChange;
  const ListCat({Key? key,  this.onChange });
  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp cont = Get.put(CategoriesControllerImp());

    int? i;
    if(controller.data != "0") {
      return
        DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.symmetric(horizontal:16),
            icon: const Icon(Icons.list_sharp),
            value: controller.currentTabCat,
            items: cont.data
                .map((list) {
              return DropdownMenuItem(
                value: list['categories_id'].toString(),
                child: Container(
                  padding: EdgeInsets.only(bottom: 3),
                    alignment : AlignmentDirectional.center,
                    width: 200, height:double.infinity, child: Text(list['categories_name'],style:TextStyle( fontSize:13,overflow:  TextOverflow.fade))),
              );
            }).toList(),
            onChanged: (value) {
              onChange!(value);
            },
          ),
        );
    }else{
      return
        DropdownButtonHideUnderline(
          child: Container(

          ),
        );
    }
  }
}

