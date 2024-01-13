

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';


enum SingingCharacter { Default,A_to_Z,Z_to_A,Price }

class RadioListTileExample extends StatefulWidget {
  const RadioListTileExample({super.key});

  @override
  State<RadioListTileExample> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  SingingCharacter? _character = SingingCharacter.Default;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Choose the sort as you want :",style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color:AppColor.primaryColor,),),
        RadioListTile<SingingCharacter>(
          title: const Text('Default'),
          value: SingingCharacter.Default,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('From A to Z'),
          value: SingingCharacter.A_to_Z,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('From Z to A'),
          activeColor:AppColor.primaryColor,
          value: SingingCharacter.Z_to_A,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Price'),
          value: SingingCharacter.Price,
          activeColor:AppColor.primaryColor,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}
