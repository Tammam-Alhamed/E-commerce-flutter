import 'package:ecommercecourse/controller/home_shope_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/controller/sort_items_controller.dart';
import 'package:ecommercecourse/core/services/services.dart';
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
  SingingCharacter? _character = SingingCharacter.Default;
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
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToitems();
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Text('127'.tr),
          value: SingingCharacter.A_to_Z,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              print(myServices.sharedPreferences.getString("lang"));
              controller.goToA_to_Z(myServices.sharedPreferences.getString("lang"));
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title:Text('128'.tr),
          activeColor:AppColor.primaryColor,
          value: SingingCharacter.Z_to_A,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToZ_to_A(myServices.sharedPreferences.getString("lang"));
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title:  Text('129'.tr),
          value: SingingCharacter.Lowest_to_Highest,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToLowest_to_Highest(myServices.sharedPreferences.getString("lang"));
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Text('130'.tr),
          value: SingingCharacter.Highest_to_Lowest,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              controller.goToHighest_to_Lowest(myServices.sharedPreferences.getString("lang"));
              _character = value;
            });
          },
        ),
      ],
    );
  }
}
