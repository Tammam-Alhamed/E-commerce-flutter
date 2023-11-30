import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home_shope_controller.dart';

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
            padding: EdgeInsets.only(right:3),
            icon: Icon(Icons.import_export),
            value: controller.currentTabCat,
            items: cont.data
                .map((list) {
              return DropdownMenuItem(
                child: Container(
                    width: 200, height: 20, child: Text(list['categories_name'])),
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

