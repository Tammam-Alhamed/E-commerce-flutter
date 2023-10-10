import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Others extends  GetView<SettingsController> {
  final  button;
  final void Function()? onPressed;
  const Others({Key? key, required this.button, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Icon(button as IconData?),

      ),
    );
  }




}
