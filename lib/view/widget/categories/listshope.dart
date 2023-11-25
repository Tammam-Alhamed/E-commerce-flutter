import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home_shope_controller.dart';

class ListShope extends GetView<HomeShopeControllerImp> {
  const ListShope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          borderRadius:BorderRadius.circular(20),
          padding:EdgeInsets.only(right:0),
          icon: Icon(Icons.add_business),

          items: controller.shope
              .map((list) {
            return DropdownMenuItem(
              child: Container(width:50, height:20,child: Text(list['shopes_name'])),
              value: list['shopes_name'].toString(),
            );
          }).toList(),
          onChanged: (value) {
       ;
          },
        ),
      );
  }
}

