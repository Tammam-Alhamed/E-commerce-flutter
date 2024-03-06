import 'package:bazar/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: AppColor.primaryColor ,
          borderRadius: BorderRadius.circular(13)),
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        elevation: 5,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
