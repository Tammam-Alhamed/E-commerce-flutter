import 'package:bazar/controller/items_controller.dart';
import 'package:bazar/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';


enum SingingCharacter { Default,A_to_Z,Z_to_A,Lowest_to_Highest,Highest_to_Lowest }

class RadioListTileExample extends StatefulWidget {
  const RadioListTileExample({super.key});

  @override
  State<RadioListTileExample> createState() => _RadioListTileExampleState();

}

class _RadioListTileExampleState extends State<RadioListTileExample> {

  ItemsControllerImp controller = Get.put(ItemsControllerImp());

  MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("125".tr,style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color:AppColor.primaryColor,),),
        RadioListTile<SingingCharacter>(
          title: Text("126".tr),
          value: SingingCharacter.Default,
          activeColor:AppColor.primaryColor,
          groupValue:controller.character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToitems();
              controller.character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Text('127'.tr),
          value: SingingCharacter.A_to_Z,
          activeColor:AppColor.primaryColor,
          groupValue: controller.character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              print(myServices.sharedPreferences.getString("lang"));
              controller.goToA_to_Z(myServices.sharedPreferences.getString("lang"));
              controller.character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title:Text('128'.tr),
          activeColor:AppColor.primaryColor,
          value: SingingCharacter.Z_to_A,
          groupValue: controller.character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToZ_to_A(myServices.sharedPreferences.getString("lang"));
              controller.character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title:  Text('129'.tr),
          value: SingingCharacter.Lowest_to_Highest,
          activeColor:AppColor.primaryColor,
          groupValue:  controller.character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToLowest_to_Highest(myServices.sharedPreferences.getString("lang"));
              controller.character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Text('130'.tr),
          value: SingingCharacter.Highest_to_Lowest,
          activeColor:AppColor.primaryColor,
          groupValue:  controller.character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToHighest_to_Lowest(myServices.sharedPreferences.getString("lang"));
              controller.character = value;
            });
          },
        ),
      ],
    );
  }
}
