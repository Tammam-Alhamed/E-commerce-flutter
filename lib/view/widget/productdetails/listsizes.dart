

import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/data/model/itemssizesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Listsizes extends GetView<ProductDetailsControllerImp> {
  final SizesModel sizesModel;
  const  Listsizes ({Key? key, required this.sizesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(

     child: Text( '${sizesModel.sizesName}',style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black) ,),
     alignment:Alignment.topCenter,
     width: 24,
     height: 22,
     decoration: BoxDecoration(

       borderRadius: BorderRadius.circular(5),
       shape: BoxShape.rectangle,
       //color: widget.sizes[index],
     ),
   );
  }
}