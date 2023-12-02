
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
else if(x=='light green'){y=Colors.green.shade200;}else if(x=='white'){y=Colors.white;} else if(x=='black'){y=Colors.black;}
else if(x=='blue'){y=Colors.blue;}else if(x=='dark blue'){y=Colors.blue.shade900;}else if(x=='light blue'){y=Colors.blue.shade200;}
else if(x=='grey'){y=Colors.grey[400];}else if(x=='yellow'){y=Colors.yellow;}else if(x=='dark yellow'){y=Colors.yellow.shade900;}else if(x=='light yellow'){y=Colors.yellow.shade200;}
else if(x=='orange'){y=Colors.orange;}else if(x=='pink'){y=Colors.pink;}else if(x=='dark pink'){y=Colors.pink.shade700;}else if(x=='light pink'){y=Colors.pink.shade200;}
else if(x=='purple'){y=Colors.purple;} if(x=='dark purple'){y=Colors.purple.shade900;}else if(x=='light purple'){y=Colors.purple.shade200;}else if(x=='zete2'){y=Color(0xE03D602A);}
else if(x=='zete1'){y=Color(0xE0597945);}else if(x=='zete'){y=Color(0xFF768569);}else if(x=='light oil'){y=Color(0xFFD1E18C);}else if(x=='zete3'){y=Color(0xFFDEECC6);}
else if(x=='desert'){y=Color(0xFFA29C09);}else if(x=='desert1'){y=Color(0xFFC5B620);}else if(x=='beeg'){y=Color(0xFFEEEAD5);} else if(x=='brown'){y=Colors.brown;}
else if(x=='brown1'){y=Colors.brown.shade200;}else if(x=='dark brown'){y=Colors.brown.shade700;}else if(x=='dark orange'){y=Color(0xFFCE5D00);}
else if(x=='ligh brown'){y=Color(0xFFCB883D);}
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
