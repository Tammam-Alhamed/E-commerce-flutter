import 'package:bazar/controller/categories_controller.dart';
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
    int? i;
    if (controller.shope != "0") {
      return
        DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,

            borderRadius: BorderRadius.circular(20),
            padding: EdgeInsets.only(right:10),
            icon: const Icon(Icons.list_sharp),
            value: controller.currentTabShope,
            items: controller.shope
                .map((list) {
              return DropdownMenuItem(
                  alignment : AlignmentDirectional.center,
                  enabled :true,
                child: Container(
                    width: 400, height: double.infinity, child: Text(list['shopes_name'],style:TextStyle( fontSize:13,overflow:  TextOverflow.ellipsis))),
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

