import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/othersview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleHome extends StatelessWidget {
  final String title ; 
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(title,
              style:const  TextStyle(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold)),
        ),

      ],
    );
  }
}
