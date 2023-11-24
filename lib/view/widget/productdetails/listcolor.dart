
import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/itemscolorsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Listcolors extends GetView<ProductDetailsControllerImp> {
  final ColorsModel colorsModel;
  const  Listcolors ({Key? key, required this.colorsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var x=colorsModel.colorsName;
var y;
if(x=='red'){y=Colors.red;}else if(x=='dark red'){y=Colors.red.shade900;}else if(x=='light red'){y=Colors.red.shade200;}else if(x=='green'){y=Colors.green;}else if(x=='dark green'){y=Colors.green.shade900;}
else if(x=='light green'){y=Colors.green.shade200;}else if(x=='white'){y=Colors.white;} else if(x=='white1'){y=Colors.amber.shade100;}else if(x=='black'){y=Colors.black;}
else if(x=='blue'){y=Colors.blue;}else if(x=='dark blue'){y=Colors.blue.shade900;}else if(x=='light blue'){y=Colors.blue.shade200;}
else if(x=='grey'){y=Colors.grey[400];}else if(x=='yallow'){y=Colors.yellow;}else if(x=='dark yallow'){y=Colors.yellow.shade900;}else if(x=='light yallow'){y=Colors.yellow.shade200;}
else if(x=='orange'){y=Colors.orange;}else if(x=='pink'){y=Colors.pink;}else if(x=='dark pink'){y=Colors.pink.shade700;}else if(x=='light pink'){y=Colors.pink.shade200;}
else if(x=='purple'){y=Colors.purple;} if(x=='dark purple'){y=Colors.purple.shade900;}else if(x=='light purple'){y=Colors.purple.shade200;}
    if (x=='white'){
      return Container(
        //  child: Text("${colorsModel.colorsName}"),
          alignment: Alignment.center,
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            border:Border.all(color: AppColor.black, width: 1.5),
            shape: BoxShape.circle,
            color: y,

          )
      );
}else {
      return Container(
        //  child: Text("${colorsModel.colorsName}"),
          alignment: Alignment.center,
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: y,

          )
      );

}
  }
}
