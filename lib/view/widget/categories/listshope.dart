import 'package:ecommercecourse/controller/categories_controller.dart';
import 'package:ecommercecourse/data/model/shopesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home_shope_controller.dart';

class ListShope extends GetView<HomeShopeControllerImp> {

  final void Function(String?)? onChange;

  const ListShope({Key? key, this.onChange });

  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp cont = Get.put(CategoriesControllerImp());

    int? i;
    if (controller.shope != "0") {
      return
        DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            borderRadius: BorderRadius.circular(20),
            padding: EdgeInsets.only(right:3),
            icon: Icon(Icons.import_export),
            value: controller.currentTabShope,
            items: controller.shope
                .map((list) {
              return DropdownMenuItem(
                child: Container(
                    width: 200, height: 20, child: Text(list['shopes_name'])),
                value: list['shopes_id'].toString(),
              );
            }).toList(),
            onChanged: (value) {
              onChange!(value);
            },
          ),
        );
    } else {
      return
        DropdownButtonHideUnderline(
          child: Container(

          ),
        );
    }
  }
}

