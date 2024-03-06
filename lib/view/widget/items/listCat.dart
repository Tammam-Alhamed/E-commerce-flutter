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
            padding: EdgeInsets.only(right:10),
            icon: Icon(Icons.list_sharp),
            value: controller.currentTabCat,
            items: cont.data
                .map((list) {
              return DropdownMenuItem(
                child: Container(
                    alignment : AlignmentDirectional.center,
                    width: 200, height:double.infinity, child: Text(list['categories_name'],style:TextStyle( fontSize:13,overflow:  TextOverflow.ellipsis))),
                value: list['categories_id'].toString(),
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

