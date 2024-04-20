
import 'package:bazar/controller/productdetails_controller.dart';
import 'package:bazar/core/constant/color.dart';
import 'package:bazar/data/model/itemscolorsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Listcolors extends GetView<ProductDetailsControllerImp> {
  final ColorsModel colorsModel;
  const  Listcolors ({Key? key, required this.colorsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var x=colorsModel.colorsName;
var y;
if(x=='red'||x=='Red'){y=Colors.red;}else if(x=='dark red'||x=='Dark red'){y=Colors.red.shade900;}else if(x=='light red'||x=='Light red'){y=Colors.red.shade200;}else if(x=='green'||x=='Green'){y=Colors.green;}else if(x=='dark green'||x=='Dark green'){y=Colors.green.shade900;}
else if(x=='light green'||x=='Light green'){y=Colors.green.shade200;}else if(x=='white'||x=='White'){y=Colors.white;} else if(x=='black'||x=='Black'){y=Colors.black;}
else if(x=='blue'||x=='Blue'){y=Colors.blue;}else if(x=='dark blue'||x=='Dark blue'){y=Colors.blue.shade900;}else if(x=='light blue'||x=='Light blue'){y=Colors.blue.shade200;}
else if(x=='grey'||x=='Grey'){y=Colors.grey[400];}else if(x=='yellow'||x=='Yellow'){y=Colors.yellow;}else if(x=='dark yellow'||x=='Dark yellow'){y=Colors.yellow.shade900;}else if(x=='light yellow'||x=='Light yellow'){y=Colors.yellow.shade200;}
else if(x=='orange'||x=='Orange'){y=Colors.orange;}else if(x=='pink'||x=='Pink'){y=Colors.pink;}else if(x=='dark pink'||x=='Dark pink'){y=Colors.pink.shade700;}else if(x=='light pink'||x=='Light pink'){y=Colors.pink.shade200;}
else if(x=='purple'||x=='Purple'){y=Colors.purple;} if(x=='dark purple'||x=='Dark purple'){y=Colors.purple.shade900;}else if(x=='light purple'||x=='Light purple'){y=Colors.purple.shade200;}else if(x=='army green2'||x=='Army green2'){y=Color(0xE03D602A);}
else if(x=='army green'||x=='Army green'){y=Color(0xE0597945);}else if(x=='army green1'||x=='Army green1'){y=Color(0xFF768569);}else if(x=='light oil'||x=='Light oil'){y=Color(0xFFD1E18C);}else if(x=='light Army green'||x=='Light Army green'){y=Color(0xFFDEECC6);}
else if(x=='Army camouflage1'||x=='army camouflage1'){y=Color(0xFFA29C09);}else if(x=='Army camouflage'||x=='army camouflage'){y=Color(0xFFC5B620);}else if(x=='Army beige'||x=='army beige'||x=='Beige'){y=Color(0xFFEEEAD5);} else if(x=='brown'||x=='Brown'){y=Colors.brown;}
else if(x=='brown1'||x=='Brown1'){y=Colors.brown.shade200;}else if(x=='dark brown'||x=='Dark brown'){y=Colors.brown.shade700;}else if(x=='dark orange'||x=='Dark orange'){y=Color(0xFFCE5D00);}
else if(x=='ligh brown'||x=='Ligh brown'){y=Color(0xFFCB883D);}
    if (x=='white'||x=='White'){

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
