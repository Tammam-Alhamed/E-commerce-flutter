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

