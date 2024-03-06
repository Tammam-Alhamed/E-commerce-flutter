import 'package:bazar/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Others extends  GetView<SettingsController> {
  final  button;
  final void Function()? onPressed;
  final color;
  const Others({Key? key, required this.button, this.onPressed,this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize:150,
        color: color,
        onPressed: onPressed,
       icon:  Icon(button as IconData?),


    );
  }




}
